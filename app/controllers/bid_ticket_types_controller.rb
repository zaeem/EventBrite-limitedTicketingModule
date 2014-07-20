class BidTicketTypesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json, :xml

  def index
      @bid_ticket_types = BidTicketType.all
  end

  def new

  end

  def update
    @bid_ticket_type = BidTicketType.find(params[:id])
  end

  def create
    if BidTicketType.create(bid_ticket_type_params)
      response = {:status => 'Success'}
    else
      errors = [];
      response = {:status => 'Unsuccessful', :errorMessageList => errors}
    end

    respond_to do |format|
      format.json { render :json => response }
    end
  end

  def modify
    bid_ticket_type = BidTicketType.find(params[:id])

    if bid_ticket_type.update_attributes(bid_ticket_type_params)
      response = {:status => 'Success'}
    else
      errors = [];
      response = {:status => 'Unsuccessful', :errorMessageList => errors}
    end

    respond_to do |format|
      format.json { render :json => response }
    end
  end

  def destroy
    @bid_ticket_type = BidTicketType.find(params[:id])
    @bid_ticket_type.destroy

    redirect_to :action => :index, :controller => :bid_ticket_types
  end

  def show
    @bid_ticket_type = BidTicketType.find(params[:id])
  end

  private
    def bid_ticket_type_params
      params.require(:bid_ticket_type).permit(:bid_id, :ticket_type_id)
    end
end
