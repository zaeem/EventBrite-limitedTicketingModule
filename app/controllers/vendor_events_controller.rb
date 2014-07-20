class VendorEventsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json, :xml

  def index
      @vendor_events = VendorEvent.all
  end

  def new

  end

  def update
    @vendor_event = VendorEvent.find(params[:id])
  end

  def create
    if VendorEvent.create(vendor_event_params)
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
    vendor_event = VendorEvent.find(params[:id])

    if vendor_event.update_attributes(vendor_event_params)
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
    @vendor_event = VendorEvent.find(params[:id])
    @vendor_event.destroy

    redirect_to :action => :index, :controller => :vendor_events
  end

  def show
    @vendor_event = VendorEvent.find(params[:id])
  end

  private
    def vendor_event_params
      params.require(:vendor_event).permit(:event_id, :vendor_id)
    end
end
