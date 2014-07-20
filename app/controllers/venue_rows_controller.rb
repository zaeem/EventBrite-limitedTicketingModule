class VenueRowsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json, :xml

  def index
      @venue_rows = VenueRow.all
  end

  def new

  end

  def update
    @venue_row = VenueRow.find(params[:id])
  end

  def create
    if VenueRow.create(venue_row_params)
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
    venue_row = VenueRow.find(params[:id])

    if venue_row.update_attributes(venue_row_params)
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
    @venue_row = VenueRow.find(params[:id])
    @venue_row.destroy

    redirect_to :action => :index, :controller => :venue_rows
  end

  def show
    @venue_row = VenueRow.find(params[:id])
  end

  def search
    errors = []
    if params[:venue_group_id] != nil
      # Search for venue rows by venue group id
      venue_rows = VenueRow.where(:venue_group_id=> params[:venue_group_id])

      if !venue_rows.present?
        errors.push({:message => 'There were no venue rows found.'})
        response = {:status => 'Unsuccessful', :errorMessageList => errors}
      else
        response = {:status => 'Success', :venueRowsList => venue_rows}
      end
    elsif params[:venue_section_id] != nil
      # Search for venue rows by venue section id
      venue_rows = VenueRow.where(:venue_section_id=> params[:venue_section_id])

      if !venue_rows.present?
        errors.push({:message => 'There were no venue rows found.'})
        response = {:status => 'Unsuccessful', :errorMessageList => errors}
      else
        response = {:status => 'Success', :venueRowsList => venue_rows}
      end
    else
      errors.push({:message => 'Venue group id not found.'})
      response = {:status => 'Unsuccessful', :errorMessageList => errors}
    end

    respond_to do |format|
       format.json { render :json => response }
     end
  end

  private
    def venue_row_params
      params.require(:venue_row).permit(:venue_section_id, :venue_group_id, :name, :seats)
    end
end
