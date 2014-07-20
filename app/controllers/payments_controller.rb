class PaymentsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json, :xml

  def index
      @payments = Payment.all
  end

  def new

  end

  def update
    @payment = Payment.find(params[:id])
  end

  def create
    if Payment.create(payment_params)
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
    payment = Payment.find(params[:id])

    if payment.update_attributes(payment_params)
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
    @payment = Payment.find(params[:id])
    @payment.destroy

    redirect_to :action => :index, :controller => :payments
  end

  def show
    @payment = Payment.find(params[:id])
  end

  private
    def payment_params
      params.require(:payment).permit(:sale_id, :payment_type, :amount)
    end
end
