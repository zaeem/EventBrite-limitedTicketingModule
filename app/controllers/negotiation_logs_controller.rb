class NegotiationLogsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json, :xml

  def index
      @negotiationlogs = NegotiationLog.all
  end

  def new

  end

  def update
    @negotiationlog = NegotiationLog.find(params[:id])
  end

  def create
    if NegotiationLog.create(negotiation_log_params)
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
    negotiation_log = NegotiationLog.find(params[:id])

    if negotiation_log.update_attributes(negotiation_log_params)
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
    @negotiationlog = NegotiationLog.find(params[:id])
    @negotiationlog.destroy

    redirect_to :action => :index, :controller => :negotiation_logs
  end

  def show
    @negotiationlog = NegotiationLog.find(params[:id])
  end

  private
    def negotiation_log_params
      params.require(:negotiation_log).permit(:bid_id, :offer_id, :price, :quantity, :negotiation_type)
    end
end
