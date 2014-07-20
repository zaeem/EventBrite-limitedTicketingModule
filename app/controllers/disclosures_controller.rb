class DisclosuresController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json, :xml

  def index
      @disclosures = Disclosure.all
  end

  def new

  end

  def update
    @disclosure = Disclosure.find(params[:id])
  end

  def create
    if Disclosure.create(disclosure_params)
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
    disclosure = Disclosure.find(params[:id])

    if disclosure.update_attributes(disclosure_params)
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
    @disclosure = Disclosure.find(params[:id])
    @disclosure.destroy

    redirect_to :action => :index, :controller => :disclosures
  end

  def show
    @disclosure = Disclosure.find(params[:id])
  end

  private
    def disclosure_params
      params.require(:disclosure).permit(:name)
    end
end
