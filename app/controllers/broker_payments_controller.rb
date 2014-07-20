class BrokerPaymentsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json, :xml

  def index
      @brokerpayments = BrokerPayment.all
  end

  def new

  end

  def update
    @brokerpayment = BrokerPayment.find(params[:id])
  end

  def create
    if BrokerPayment.create(broker_payment_params)
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
    broker_payment = BrokerPayment.find(params[:id])

    if broker_payment.update_attributes(broker_payment_params)
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
    @brokerpayment = BrokerPayment.find(params[:id])
    @brokerpayment.destroy

    redirect_to :action => :index, :controller => :broker_payments
  end

  def show
    @brokerpayment = BrokerPayment.find(params[:id])
  end

  private
    def broker_payment_params
      params.require(:broker_payment).permit(:amount, :payment_type, :status)
    end
end
