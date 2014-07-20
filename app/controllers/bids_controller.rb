class BidsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  require 'emailmailer.rb'
  include EmailMailer

  respond_to :json, :xml

  def index
      @bids = Bid.all
  end

  def new

  end

  def update
    @bid = Bid.find(params[:id])
  end

  def create
    bid_result = create_bid(params)

    if bid_result.status == 'Success'
      response = {:status => 'Success', :bid_id => bid_result.bid.id}
    else
      response = {:status => 'Unsuccessful', :errorMessageList => bid_result.errorMessageList}
    end

    respond_to do |format|
      format.json { render :json => response }
    end
  end

  def modify
    bid = Bid.find(params[:id])
    response = modify_bid(bid,params)

    respond_to do |format|
      format.json { render :json => response }
    end
  end

  def destroy
    @bid = Bid.find(params[:id])
    @bid.destroy

    redirect_to :action => :index, :controller => :bids
  end

  def show
    @bid = Bid.find(params[:id])
  end

  def search
    errors = []
    if params[:event_id] != nil
      # Search for bids by event id
      bids = Bid.where(:event_id=> params[:event_id])

      if bids.present?
        response = {:status => 'Success', :bidsList => bids}
      else
        errors.push({:message => 'There were no bids found.'})
        response = {:status => 'Unsuccessful', :errorMessageList => errors}
      end
    else
      errors.push({:message => 'Event id not found.'})
      response = {:status => 'Unsuccessful', :errorMessageList => errors}
    end

    respond_to do |format|
       format.json { render :json => response }
     end
  end

  private
    def bid_params
      params.require(:bid).permit(:event_id, :user_id, :venue_group_id, :price, :quantity, :proxy, :expires_at, :cancel_others, :status, :in_hand_date, :is_negotiation, :expected_ship_date)
    end
end