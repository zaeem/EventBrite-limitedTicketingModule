class OfferTicketsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json, :xml

  def index
      @offertickets = OfferTicket.all
  end

  def new

  end

  def update
    @offerticket = OfferTicket.find(params[:id])
  end

  def create
    if OfferTicket.create(offer_ticket_params)
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
    offer_ticket = OfferTicket.find(params[:id])

    if offer_ticket.update_attributes(offer_ticket_params)
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
    @offerticket = OfferTicket.find(params[:id])
    @offerticket.destroy

    redirect_to :action => :index, :controller => :offer_tickets
  end

  def show
    @offerticket = OfferTicket.find(params[:id])
  end

  private
    def offer_ticket_params
      params.require(:offer_ticket).permit(:offer_id, :venue_row_id, :status, :seat_number, :barcode, :attendee_name)
    end
end
