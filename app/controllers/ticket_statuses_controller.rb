class TicketStatusesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json, :xml

  def index
      @ticket_statuses = TicketStatus.all
  end

  def new

  end

  def update
    @ticket_status = TicketStatus.find(params[:id])
  end

  def create
    if TicketStatus.create(ticket_status_params)
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
    ticket_status = TicketStatus.find(params[:id])

    if ticket_status.update_attributes(ticket_status_params)
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
    @ticket_status = TicketStatus.find(params[:id])
    @ticket_status.destroy

    redirect_to :action => :index, :controller => :ticket_statuses
  end

  def show
    @ticket_status = TicketStatus.find(params[:id])
  end

  private
    def ticket_status_params
      params.require(:ticket_status).permit(:name)
    end
end
