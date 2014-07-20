class AddressesController < ApplicationController    
  skip_before_filter :verify_authenticity_token

  respond_to :json, :xml

  def index
      @addresses = Address.all
  end

  def new

  end

  def update
    @address = Address.find(params[:id])
  end

  def create
    if Address.create(address_params)
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
    address = Address.find(params[:id])

    if address.update_attributes(address_params)
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
    @address = Address.find(params[:id])
    @address.destroy

    redirect_to :action => :index
  end

  def show
      @address = Address.find(params[:id])
  end

  private
    def address_params
      params.require(:address).permit(:user_id, :address_type, :name, :address1, :address2, :city, :state, :phone)
    end
end
