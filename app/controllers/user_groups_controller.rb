class UserGroupsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json, :xml

  def index
      @user_groups = UserGroup.all
  end

  def new

  end

  def update
    @user_group = UserGroup.find(params[:id])
  end

  def create
    if UserGroup.create(user_group_params)
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
    user_group = UserGroup.find(params[:id])

    if user_group.update_attributes(user_group_params)
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
    @user_group = UserGroup.find(params[:id])
    @user_group.destroy

    redirect_to :action => :index, :controller => :user_groups
  end

  def show
    @user_group = UserGroup.find(params[:id])
  end

  private
    def user_group_params
      params.require(:user_group).permit(:name, :admin)
    end
end
