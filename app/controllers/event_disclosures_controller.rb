class EventDisclosuresController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json, :xml

  def index
      @event_disclosures = EventDisclosure.all
  end

  def new

  end

  def update
    @event_disclosure = EventDisclosure.find(params[:id])
  end

  def create
    if EventDisclosure.create(event_disclosure_params)
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
    event_disclosure = EventDisclosure.find(params[:id])

    if event_disclosure.update_attributes(event_disclosure_params)
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
    @event_disclosure = EventDisclosure.find(params[:id])
    @event_disclosure.destroy

    redirect_to :action => :index, :controller => :event_disclosures
  end

  def show
    @event_disclosure = EventDisclosure.find(params[:id])
  end

  private
    def event_disclosure_params
      params.require(:event_disclosure).permit(:event_id, :disclosure_id, :venue_section_id)
    end
end
