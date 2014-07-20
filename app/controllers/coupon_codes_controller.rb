class CouponCodesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json, :xml

  def index
      @couponcodes = CouponCode.all
  end

  def new

  end

  def update
    @couponcode = CouponCode.find(params[:id])
  end

  def create
    if CouponCode.create(coupon_code_params)
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
    coupon_code = CouponCode.find(params[:id])

    if coupon_code.update_attributes(coupon_code_params)
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
    @couponcode = CouponCode.find(params[:id])
    @couponcode.destroy

    redirect_to :action => :index, :controller => :coupon_codes
  end

  def show
    @couponcode = CouponCode.find(params[:id])
  end

  private
    def coupon_code_params
      params.require(:coupon_code).permit(:code, :discount_type, :amount, :quantity, :starts_at, :expires_at)
    end
end
