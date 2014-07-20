class SalesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  require 'emailmailer.rb'
  include EmailMailer

  respond_to :json, :xml

  def index
      @sales = Sale.all
  end

  def new

  end

  def update
    @sale = Sale.find(params[:id])
  end

  def create
    if Sale.create(sale_params)
      response = {:status => 'Success'}
    else
      errors = []
      response = {:status => 'Unsuccessful', :errorMessageList => errors}
    end

    respond_to do |format|
      format.json { render :json => response }
    end
  end

  def modify
    sale = Sale.find(params[:id])

    if sale.update_attributes(sale_params)
      response = {:status => 'Success'}
    else
      errors = []
      response = {:status => 'Unsuccessful', :errorMessageList => errors}
    end

    respond_to do |format|
      format.json { render :json => response }
    end
  end

  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy

    redirect_to :action => :index, :controller => :sales
  end

  def show
    @sale = Sale.find(params[:id])
  end

  private
    def sale_params
      params.require(:sale).permit(:offer_id, :ticket_status_id, :quantity, :price, :affiliate_id, :payment_status, :coupon_code_id)
    end
end
