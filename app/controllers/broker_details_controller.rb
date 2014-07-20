class BrokerDetailsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json, :xml

  def index
      @brokerdetails = BrokerDetail.all
  end

  def new

  end

  def update
    @brokerdetail = BrokerDetail.find(params[:id])
  end

  def create
    if BrokerDetail.create(broker_detail_params)
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
    broker_detail = BrokerDetail.find(params[:id])

    if broker_detail.update_attributes(broker_detail_params)
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
    @brokerdetail = BrokerDetail.find(params[:id])
    @brokerdetail.destroy

    redirect_to :action => :index, :controller => :broker_details
  end

  def show
    @brokerdetail = BrokerDetail.find(params[:id])
  end

  private
    def broker_detail_params
      params.require(:broker_detail).permit(:user_id, :kickback_percentage, :kickback_flat_fee, :kickback_type, :reduction_percentage, :reduction_flat_fee, :reduction_type, :payment_threshold, :locked, :payment_method, :payments_active)
    end
end