class TicketTypesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json, :xml

  def index
      @ticket_types = TicketType.all
  end

  def new

  end

  def update
    @ticket_type = TicketType.find(params[:id])
  end

  def create
    if TicketType.create(ticket_type_params)
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
    ticket_type = TicketType.find(params[:id])

    if ticket_type.update_attributes(ticket_type_params)
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
    @ticket_type = TicketType.find(params[:id])
    @ticket_type.destroy

    redirect_to :action => :index, :controller => :ticket_types
  end

  def show
    @ticket_type = TicketType.find(params[:id])
  end

  private
    def ticket_type_params
      params.require(:ticket_type).permit(:name)
    end
end
