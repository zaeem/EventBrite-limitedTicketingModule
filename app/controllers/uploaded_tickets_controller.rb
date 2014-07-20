class UploadedTicketsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json, :xml

  def index
      @uploaded_tickets = UploadedTicket.all
  end

  def new

  end

  def update
    @uploaded_ticket = UploadedTicket.find(params[:id])
  end

  def create
    # 1. Will need some sort of PDF ticket verification step here
    # to check for authenticity and security measures

    # 2. Save ticket in a specified path based on user id
    # 3. Store path in database/uploadedTickets table?

    if UploadedTicket.create(uploaded_ticket_params)
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
    uploaded_ticket = UploadedTicket.find(params[:id])

    if uploaded_ticket.update_attributes(uploaded_ticket_params)
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
    @uploaded_ticket = UploadedTicket.find(params[:id])
    @uploaded_ticket.destroy

    redirect_to :action => :index, :controller => :uploaded_tickets
  end

  def show
    @uploaded_ticket = UploadedTicket.find(params[:id])
  end

  private
    def uploaded_ticket_params
      params.require(:uploaded_ticket).permit(:offer_ticket_id, :ticket_file)
    end
end