class OfferDisclosuresController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json, :xml

  def index
      @offerdisclosures = OfferDisclosure.all
  end

  def new

  end

  def update
    @offerdisclosure = OfferDisclosure.find(params[:id])
  end

  def create
    if OfferDisclosure.create(offer_disclosure_params)
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
    offer_disclosure = OfferDisclosure.find(params[:id])

    if offer_disclosure.update_attributes(offer_disclosure_params)
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
    @offerdisclosure = OfferDisclosure.find(params[:id])
    @offerdisclosure.destroy

    redirect_to :action => :index, :controller => :offer_disclosures
  end

  def show
    @offerdisclosure = OfferDisclosure.find(params[:id])
  end

  private
    def offer_disclosure_params
      params.require(:offer_disclosure).permit(:offer_id, :disclosure_id)
    end
end
