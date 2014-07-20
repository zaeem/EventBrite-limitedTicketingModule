class AffiliatePaymentsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json, :xml

  def index
      @affiliate_payments = AffiliatePayment.all
  end

  def new

  end

  def update
    @affiliate_payment = AffiliatePayment.find(params[:id])
  end

  def create
    if AffiliatePayment.create(affiliate_payment_params)
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
    affiliate_payment = AffiliatePayment.find(params[:id])

    if affiliate_payment.update_attributes(affiliate_payment_params)
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
    @affiliate_payment = AffiliatePayment.find(params[:id])
    @affiliate_payment.destroy

    redirect_to :action => :index, :controller => :affiliate_payments
  end

  def show
    @affiliate_payment = AffiliatePayment.find(params[:id])
  end

  private
    def affiliate_payment_params
      params.require(:affiliate_payment).permit(:user_id, :amount, :affiliate_type, :status)
    end
end
