class VendorsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json, :xml

  def index
      @vendors = Vendor.all
  end

  def new

  end

  def update
    @vendor = Vendor.find(params[:id])
  end

  def create
    if Vendor.create(vendor_params)
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
    vendor = Vendor.find(params[:id])

    if vendor.update_attributes(vendor_params)
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
    @vendor = Vendor.find(params[:id])
    @vendor.destroy

    redirect_to :action => :index, :controller => :vendors
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  private
    def vendor_params
      params.require(:vendor).permit(:name)
    end
end

