class VenueSectionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json, :xml

  def index
      @venue_sections = VenueSection.all
  end

  def new

  end

  def update
    @venue_section = VenueSection.find(params[:id])
  end

  def create
    if VenueSection.create(venue_section_params)
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
    venue_section = VenueSection.find(params[:id])

    if venue_section.update_attributes(venue_section_params)
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
    @venue_section = VenueSection.find(params[:id])
    @venue_section.destroy

    redirect_to :action => :index, :controller => :venue_sections
  end

  def show
    @venue_section = VenueSection.find(params[:id])
  end

  def search
    errors = []
    if params[:venue_id] != nil
      # Search for venue sections by venue id
      venue_sections = VenueSection.where(:venue_id=> params[:venue_id])

      if !venue_sections.present?
        errors.push({:message => 'There were no venue sections found.'})
        response = {:status => 'Unsuccessful', :errorMessageList => errors}
      else
        response = {:status => 'Success', :venueSectionsList => venue_sections}
      end
    elsif params[:section_number] != nil
      # Search for venue sections by section id
      venue_sections = VenueSection.where(:section_number=> params[:section_number])

      if !venue_sections.present?
        errors.push({:message => 'There were no venue sections found.'})
        response = {:status => 'Unsuccessful', :errorMessageList => errors}
      else
        response = {:status => 'Success', :venueSectionsList => venue_sections}
      end
    else
      errors.push({:message => 'Venue id or section number not found.'})
      response = {:status => 'Unsuccessful', :errorMessageList => errors}
    end

    respond_to do |format|
       format.json { render :json => response }
     end
  end

  private
    def venue_section_params
      params.require(:venue_section).permit(:raphael_date, :color, :section_text, :section_number, :row_start, :row_end, :photo)
    end
end
