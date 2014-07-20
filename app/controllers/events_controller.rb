require 'net/http'

class EventsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json, :xml

  def index
      @events = Event.all
  end

  def new

  end

  def update
    @event = Event.find(params[:id])
  end

  def create
    if Event.create(event_params)
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
    event = Event.find(params[:id])

    if event.update_attributes(event_params)
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
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to :action => :index, :controller => :events
  end

  def show
    @event = Event.find(params[:id])
  end

  def search
    errors = []
    if params[:query] != nil
      # Search by query term or keyword of terms (Artist, Venue, Team or Event)
      events = Event.search(params[:query])

      if !events.present?
        errors.push({:message => 'There were no events found.'})
        response = {:status => 'Unsuccessful', :errorMessageList => errors}
      else
        response = {:status => 'Success', :eventList => events}
      end
    elsif params[:location] != nil
      # Search by location (City and State or Zip Code)
      # Google GEO coding to get Long/Lat, if successful fill values
      # NOTE: Access to the internet is REQUIRED for Google GEO coding
      response = Net::HTTP.get_response('maps.googleapis.com','/maps/api/geocode/json?sensor=false&address='+params[:location])
      results = JSON.parse(response.body)['results']
      address_components = results[0]['address_components']

      address_components.each do |address|
        if address['types'][0] == 'postal_code'
          @zip = address['long_name']
          break
        end
      end

      events = Event.where(:venue_id => Venue.where(:zip=>@zip))

      if !events.present?
        errors.push({:message => 'There were no events found.'})
        response = {:status => 'Unsuccessful', :errorMessageList => errors}
      else
        response = {:status => 'Success', :eventList => events}
      end
    elsif params[:start_date] != nil && params[:end_date] != nil
      # Search by date (start date and end date)
      events = Event.where('event_date BETWEEN ? AND ?', params[:start_date].to_date, params[:end_date].to_date)
      #.all

      if !events.present?
        errors.push({:message => 'There were no events found.'})
        response = {:status => 'Unsuccessful', :errorMessageList => errors}
      else
        response = {:status => 'Success', :eventList => events}
      end
    else
      errors.push({:message => 'Query, location or date search params not found.'})
      response = {:status => 'Unsuccessful', :errorMessageList => errors}
    end

    respond_to do |format|
       format.json { render :json => response }
     end
  end

  private
    def event_params
      params.require(:event).permit(:venue_id, :name, :event_date, :description, :primary, :primary_pdf, :seatgeek_id)
    end
end
