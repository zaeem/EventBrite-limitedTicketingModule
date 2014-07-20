class AffiliateDetailsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json, :xml

  def index
      @affiliate_details = AffiliateDetail.all
  end

  def new

  end

  def update
    @affiliate_detail = AffiliateDetail.find(params[:id])
  end

  def create
    if AffiliateDetail.create(affiliate_detail_params)
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
    affiliate_detail = AffiliateDetail.find(params[:id])

    if affiliate_detail.update_attributes(affiliate_detail_params)
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
    @affiliate_detail = AffiliateDetail.find(params[:id])
    @affiliate_detail.destroy

    redirect_to :action => :index
  end

  def show
      @affiliate_detail = AffiliateDetail.find(params[:id])
  end

  private
    def affiliate_detail_params
      params.require(:affiliate_detail).permit(:user_id, :percentage, :flat_fee, :commissionable_type, :payment_threshold, :locked, :payment_method, :affiliate_token, :token_active, :payments_active)
    end
end
