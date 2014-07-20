class MembershipsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json, :xml

  def index
      @memberships = Membership.all
  end

  def new

  end

  def update
    @membership = Membership.find(params[:id])
  end

  def create
    if Membership.create(membership_params)
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
    membership = Membership.find(params[:id])

    if membership.update_attributes(membership_params)
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
    @membership = Membership.find(params[:id])
    @membership.destroy

    redirect_to :action => :index, :controller => :memberships
  end

  def show
    @membership = Membership.find(params[:id])
  end

  private
    def membership_params
      params.require(:membership).permit(:user_id, :user_group_id, :created_by)
    end
end
