class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  require 'emailmailer.rb'
  include EmailMailer

  respond_to :json, :xml

  def index
      @users = User.all
  end

  def new

  end

  def update
    @user = User.find(params[:id])
  end

  def create
    u = User.create(user_params)
    if u.valid?
      response = send_email('Welcome to Slicket Ticket',
                            'Welcome to Slicket Ticket',
                            'new_user',
                            {:first_name => params[:first_name],
                             :last_name => params[:last_name],
                             :email => params[:email]})
    else
      errors = [u.errors.messages]
      response = {:status => 'Unsuccessful', :errorMessageList => errors}
    end

    respond_to do |format|
      format.json { render :json => response }
    end
  end

  def modify
    user = User.find(params[:id])

    if user.update_attributes(user_params)
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
    @user = User.find(params[:id])
    @user.destroy

    redirect_to :action => :index
  end

  def show
      @user = User.find(params[:id])
  end

  def auth
    if !(user = User.find_by_email(params[:email]))
      errors = [:message => 'The email you entered was not found.']
      response = {:status => 'Unsuccessful', :errorMessageList => errors}
    elsif user.password != params[:password] #create hash for password verification
      errors = [:message => 'The password you entered was incorrect.']
      response = {:status => 'Unsuccessful', :errorMessageList => errors}
      # Should we store login attempt count?
    else
      # Should we store session info in a table with ipaddress, OS/Browser info for each session login?
      # And/Or a machine table to log each machine id with an ip address and user login attempt?
      errors = []
      response = {:status => 'Success', :userid => user.id, :errorMessageList => errors}
    end

    respond_to do |format|
       format.json { render :json => response }
     end
  end

  def forgot_password
    if User.find_by_email(params[:email])
      # Send email with link for password reset
      url = 'http://slicket-api.herokuapp.com' #to be changed when view is created
      response = send_email('Slicket Ticket Account Change',
                            'Slicket Ticket Account Password Reset. Click here to reset your password:'+url,
                            'forgot_password',
                            {:first_name => params[:first_name],
                             :last_name => params[:last_name],
                             :email => params[:email],
                             :url => url})
    else
      errors = [:message => 'The email you entered was not found.']
      response = {:status => 'Unsuccessful', :errorMessageList => errors}
    end

    respond_to do |format|
       format.json { render :json => response }
     end
  end

  def change_password
    if !(user = User.find_by_email(params[:email]))
      errors = [:message => 'The email you entered was not found.']
      response = {:status => 'Unsuccessful', :errorMessageList => errors}
    # Verify old password matches (if reset the updated password still should match)
    elsif user.password != params[:password] #create hash for password verification
      errors = [:message => 'The password you entered was incorrect.']
      response = {:status => 'Unsuccessful', :errorMessageList => errors}
    else
      user.password = params[:new_password]
      user.save

      # Send email on confirmation that password was reset
      response = send_email('Slicket Ticket Account Change',
                            'Your password has been successfully changed. If you did not request this please contact Slicket Ticket Support.',
                            'change_password',
                            {:first_name => params[:first_name],
                             :last_name => params[:last_name],
                             :email => params[:email]})
    end

    respond_to do |format|
       format.json { render :json => response }
     end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :title, :first_name, :last_name, :middle_name, :phone, :phone_daytime, :phone_evening, :phone_cell, :subscribe, :sale_commission, :negotiation_commission, :security_question1, :security_answer1)
    end
end
