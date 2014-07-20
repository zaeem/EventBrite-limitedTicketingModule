class SettingsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json, :xml

  def index
      @settings = Setting.all
  end

  def new

  end

  def update
    @setting = Setting.find(params[:id])
  end

  def create
    if Setting.create(setting_params)
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
    setting = Setting.find(params[:id])

    if setting.update_attributes(setting_params)
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
    @setting = Setting.find(params[:id])
    @setting.destroy

    redirect_to :action => :index, :controller => :settings
  end

  def show
    @setting = Setting.find(params[:id])
  end

  private
    def setting_params
      params.require(:setting).permit(:name, :value)
    end
end
