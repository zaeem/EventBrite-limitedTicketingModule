require 'spec_helper'

describe EventsController do
  #	Geolocating should be implemented and search results should first populate with the closest events.
  it 'should succeed event search by location' do
    @venue = FactoryGirl.create(:venue)
    @event = FactoryGirl.create(:event, event_date: DateTime.parse('17-03-2017'), venue_id: @venue.id)
    request.env['HTTP_AUTHORIZATION'] = 'Token token='+$auth_token

    get 'search', :location => '33067', :format => :json
    response.should be_success

    # Parse json response and test the json structure
    body = JSON.parse(response.body)
    body.should include('status')
    status = body['status']
    status.should include('Success')
    event_list = body['eventList']
    event_list[0]['name'].should == 'Football'
  end
  
  # When a user searches by date all events on that date will populate, closest events first
  it 'should succeed event search by date' do
    @venue = FactoryGirl.create(:venue)
    @event = FactoryGirl.create(:event, event_date: DateTime.parse('17-03-2017'), venue_id: @venue.id)
    request.env['HTTP_AUTHORIZATION'] = 'Token token='+$auth_token

    get 'search', :start_date => DateTime.parse('17-03-2017'), :end_date => DateTime.parse('17-03-2017'), :format => :json
    response.should be_success

    # Parse json response and test the json structure
    body = JSON.parse(response.body)
    body.should include('status')
    status = body['status']
    status.should include('Success')
    event_list = body['eventList']
    event_list[0]['name'].should == 'Football'
  end

  # When a user searches by venue, all events at that venue should populate by date first
  it 'should succeed event search by venue' do
    # TODO Need to implement search by venue
  end

  # When a user searches by keyword, all events with that particular keyword should populate by date and then by distance.
  it 'should succeed event search by keyword' do
    @venue = FactoryGirl.create(:venue)
    @event = FactoryGirl.create(:event, event_date: DateTime.parse('17-03-2017'), venue_id: @venue.id)
    request.env['HTTP_AUTHORIZATION'] = 'Token token='+$auth_token

    get 'search', :query => 'Football', :format => :json
    response.should be_success

    # Parse json response and test the json structure
    body = JSON.parse(response.body)
    body.should include('status')
    status = body['status']
    status.should include('Success')
    event_list = body['eventList']
    event_list[0]['name'].should == 'Football'
  end

  # When a user searches for an event or team name, all events should populate by the specific event searched for.  First by date, then by distance.
  it 'should succeed event search by event/team name' do
    # TODO add search by team name
    @venue = FactoryGirl.create(:venue)
    @event = FactoryGirl.create(:event, event_date: DateTime.parse('17-03-2017'), venue_id: @venue.id)
    request.env['HTTP_AUTHORIZATION'] = 'Token token='+$auth_token

    get 'search', :query => 'Football', :format => :json
    response.should be_success

    # Parse json response and test the json structure
    body = JSON.parse(response.body)
    body.should include('status')
    status = body['status']
    status.should include('Success')
    event_list = body['eventList']
    event_list[0]['name'].should == 'Football'
  end
end