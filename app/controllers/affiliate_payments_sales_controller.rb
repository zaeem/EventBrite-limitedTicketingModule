class AffiliatePaymentsSalesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json, :xml

  def index
      @affiliate_payments_sales = AffiliatePaymentsSale.all
  end

  def new

  end

  def update
    @affiliate_payments_sale = AffiliatePaymentsSale.find(params[:id])
  end

  def create
    if AffiliatePaymentsSale.create(affiliate_payment_sale_params)
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
    affiliate_payment_sale = AffiliatePaymentsSale.find(params[:id])

    if affiliate_payment_sale.update_attributes(affiliate_payment_sale_params)
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
    @affiliate_payments_sale = AffiliatePaymentsSale.find(params[:id])
    @affiliate_payments_sale.destroy

    redirect_to :action => :index, :controller => :affiliate_payments_sales
  end

  def show
    @affiliate_payments_sale = AffiliatePaymentsSale.find(params[:id])
  end

  private
    def affiliate_payment_sale_params
      params.require(:affiliate_payment_sale).permit(:affiliate_payment_id, :sale_id)
    end
end
