class VenueGroupsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json, :xml

  def index
      @venue_groups = VenueGroup.all
  end

  def new

  end

  def update
    @venue_group = VenueGroup.find(params[:id])
  end

  def create
    if VenueGroup.create(venue_group_params)
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
    venue_group = VenueGroup.find(params[:id])

    if venue_group.update_attributes(venue_group_params)
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
    @venue_group = VenueGroup.find(params[:id])
    @venue_group.destroy

    redirect_to :action => :index, :controller => :venue_groups
  end

  def show
    @venue_group = VenueGroup.find(params[:id])
  end

  def search
    errors = []
    if params[:venue_id] != nil
      # Search for venue groups by venue id
      venue_groups = VenueGroup.where(:venue_id=> params[:venue_id])

      if !venue_groups.present?
        errors.push({:message => 'There were no venue groups found.'})
        response = {:status => 'Unsuccessful', :errorMessageList => errors}
      else
        response = {:status => 'Success', :venueGroupsList => venue_groups}
      end
    else
      errors.push({:message => 'Venue id not found.'})
      response = {:status => 'Unsuccessful', :errorMessageList => errors}
    end

    respond_to do |format|
       format.json { render :json => response }
     end
  end


  private
    def venue_group_params
      params.require(:venue_group).permit(:name, :rating, :venue_id)
    end
end