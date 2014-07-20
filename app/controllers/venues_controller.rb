class VenuesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json, :xml

  def index
      @venues = Venue.all
  end

  def new

  end

  def update
    @venue = Venue.find(params[:id])
  end

  def create
    if Venue.create(venue_params)
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
    venue = Venue.find(params[:id])

    if venue.update_attributes(venue_params)
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
    @venue = Venue.find(params[:id])
    @venue.destroy

    redirect_to :action => :index, :controller => :venues
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def search
    # Search by query term or keyword of terms
    venues = Venue.search(params[:query])

    if (venues.empty?)
      errors = [:message => 'There were no venues found. Please try again.']
      response = {:status => 'Unsuccessful', :errorMessageList => errors}
    else
      response = {:status => 'Success', :venueList => venues}
    end

    respond_to do |format|
       format.json { render :json => response }
     end
  end

  private
    def venue_params
      params.require(:venue).permit(:category, :subcategory, :name, :team, :street_address, :city, :state, :zip, :phone, :description, :school, :team_name, :mascot, :seatgeek_id, :photo)
    end
end

