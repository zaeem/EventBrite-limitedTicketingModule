require 'spec_helper'

describe UsersController do
  #	A user must enter their email address and password.
  it 'should succeed user login' do
    @user = FactoryGirl.create(:user)
    request.env['HTTP_AUTHORIZATION'] = 'Token token='+$auth_token
    get 'auth', :email => @user.email, :password => @user.password, :format => :json
   	response.should be_success

   	# Parse json response and test the json structure
   	body = JSON.parse(response.body)
   	body.should include('status')
   	status = body['status']
   	status.should include('Success')
  end

  #	A user must also implement security questions upon initial account creation.
  it 'should succeed user security questions' do
    # TODO: need to implement security questions/answers in db/controllers
  end

  #	A user will have three login attempts before they are locked out of their account.
  it 'should succeed locking a user out after 3 attempts' do
    # TODO: need to implement failed attempt count in db/controllers
  end

  #	When a user is locked out of their account they will receive a token in their email to reset their password.
  it 'should successfully email user after lockout' do
    # TODO: need to implement third failed attempt email function
  end
end