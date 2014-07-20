class BrokerPaymentsSalesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json, :xml

  def index
      @brokerpaymentssales = BrokerPaymentsSale.all
  end

  def new

  end

  def update
    @brokerpaymentssale = BrokerPaymentsSale.find(params[:id])
  end

  def create
    if BrokerPaymentsSale.create(broker_payment_sale_params)
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
    broker_payment_sale = BrokerPaymentsSale.find(params[:id])

    if broker_payment_sale.update_attributes(broker_payment_sale_params)
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
    @brokerpaymentssale = BrokerPaymentsSale.find(params[:id])
    @brokerpaymentssale.destroy

    redirect_to :action => :index, :controller => :broker_payments_sales
  end

  def show
    @brokerpaymentssale = BrokerPaymentsSale.find(params[:id])
  end

  private
    def broker_payment_sale_params
      params.require(:broker_payment_sale).permit(:broker_payment_id, :sale_id)
    end
end
