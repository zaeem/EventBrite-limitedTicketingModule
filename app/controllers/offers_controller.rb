class OffersController < ApplicationController
  skip_before_filter :verify_authenticity_token
  require 'emailmailer.rb'
  include EmailMailer

  respond_to :json, :xml

  def index
      @offers = Offer.all
  end

  def new

  end

  def update
    @offer = Offer.find(params[:id])
  end

  def create
    response = create_offer(params)

    respond_to do |format|
      format.json { render :json => response }
    end
  end

  def modify
    response = Offer.modify_offer(params)

    respond_to do |format|
      format.json { render :json => response }
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy

    redirect_to :action => :index, :controller => :offers
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def search
    errors = []
    ticket_type_id = TicketType.where(:name => params[:ticket_type] != nil ? params[:ticket_type] : 'all').first.id

    if params[:event_id] != nil
      # Search for offers by event id
      offers = Offer.where(:event_id=> params[:event_id], :ticket_type_id => ticket_type_id)

      if offers.present?
        response = {:status => 'Success', :offerList => offers}
      else
        errors.push({:message => 'There were no offers found.'})
        response = {:status => 'Unsuccessful', :errorMessageList => errors}
      end
    elsif params[:filters] != nil
      disclosures = []
      params[:filters].each do |filter|
        JSON.parse(filter)['disclosures'].each do |disclosure|
          disclosures.push(disclosure)
        end
      end

      matched_disclosures = Disclosure.where('name IN (?)', disclosures)
      offers = Offer.joins(:offer_disclosures).where('offer_disclosures.disclosure_id' => matched_disclosures.first.id, :ticket_type_id => ticket_type_id)

      if offers.present?
        response = {:status => 'Success', :offerList => offers}
      else
        errors.push({:message => 'There were no offers found.'})
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
    def offer_params
      params.require(:offer).permit(:event_id, :user_id, :venue_group_id, :ticket_type_id, :price, :proxy, :multiple, :cancel_others, :status, :in_hand_date, :expected_ship_date, :is_negotiation, :expires_at, :confirm_transaction, :piggy_backed, :notes)
    end
end
