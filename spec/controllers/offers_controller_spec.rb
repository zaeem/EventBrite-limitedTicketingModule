require 'spec_helper'

describe OffersController do
  # Setup test data for offer scenarios
  before(:all) do
    @offer1 = FactoryGirl.create(:offer, price: '150.00', quantity: 4, proxy: '125.00', multiple: 2, ticket_type_id: 1)
    @offer2 = FactoryGirl.create(:offer, price: '165.00', quantity: 4, proxy: '120.00', multiple: 4, ticket_type_id: 2)
    @disclosure1 = FactoryGirl.create(:disclosure, name: 'No Alcohol Section')
    @offer_disclosure1 = FactoryGirl.create(:offer_disclosure, offer_id: @offer1.id, disclosure_id: @disclosure1.id)
    @offer_disclosure2 = FactoryGirl.create(:offer_disclosure, offer_id: @offer2.id, disclosure_id: @disclosure1.id)
  end

  #	When a buyer or a seller searches for tickets we should be narrowing the available bids or offers based upon the disclosures of the buyers or sellers.
  it 'should succeed ticket search by disclosure filter' do
    request.env['HTTP_AUTHORIZATION'] = 'Token token='+$auth_token
    get 'search', :filters => [{:disclosures => ['No Alcohol Section']}.to_json], :ticket_type => 'hard', :format => :json
    response.should be_success

    # Parse json response and test the json structure
    body = JSON.parse(response.body)
    body.should include('status')
    status = body['status']
    status.should include('Success')
    offer_list = body['offerList']
    offer_list[0]['event_id'].should == 1
  end

  #	If a buyer only wants to view tickets that are already in-hand, then we should only show them those tickets.  Or, if they buyer is only wishing for e-tckets only we should only show them e-tickets.
  it 'should succeed ticket search by filter for in-hand only' do
    request.env['HTTP_AUTHORIZATION'] = 'Token token='+$auth_token
    get 'search', :filters => [{:disclosures => ['No Alcohol Section']}.to_json], :ticket_type => 'hard', :format => :json
    response.should be_success

    # Parse json response and test the json structure
    body = JSON.parse(response.body)
    body.should include('status')
    status = body['status']
    status.should include('Success')
    offer_list = body['offerList']
    offer_list[0]['event_id'].should == 1
  end

  #	Also, if a seller has e-tickets, then they should only see bids that are willing to accept e-tickets or any ticket type.
  it 'should succeed ticket search by filter for e-tickets only' do
    request.env['HTTP_AUTHORIZATION'] = 'Token token='+$auth_token

    get 'search', :filters => [{:disclosures => ['No Alcohol Section']}.to_json], :ticket_type => 'e-ticket', :format => :json
    response.should be_success

    # Parse json response and test the json structure
    body = JSON.parse(response.body)
    body.should include('status')
    status = body['status']
    status.should include('Success')
    offer_list = body['offerList']
    offer_list[0]['event_id'].should == 1
  end

  # Seller will confirm the sale.
  it 'will succeed a sellers confirmation'
    #it 'should succeed a sellers confirmation' do
    #  @offer = FactoryGirl.create(:offer)
    #  request.env['HTTP_AUTHORIZATION'] = 'Token token='+$auth_token
    #
    #  get 'modify', :offer_attributes => {:status => 'Approved', :id => @offer.id}, :format => :json
    #  response.should be_success
    #
    #  # Parse json response and test the json structure
    #  body = JSON.parse(response.body)
    #  body.should include('status')
    #  status = body['status']
    #  status.should include('Success')
    #  offer_list = body['offerList']
    #  offer_list[0]['event_id'].should == 1
    #end

  # Enter a new offer - 4.	The user now enters the rest of their ticket details such as ticket type,
  # expected ship date, in hand date, etc.
  it 'will succeed with the creation of a new offer' do
    # - Create the offer
    # - Create offer ticket entries for each ticket based on the quantity available
    # - Check if existing offers will allow for immediate sale
    # - Initiate Sale and execute offer Z at $150 by sending email to seller for confirmation
    @offer_scenario_z = FactoryGirl.create(:offer,
                                           price: '150.00',
                                           quantity: 4,
                                           proxy: '125.00',
                                           multiple: 2,
                                           ticket_type_id: 2,
                                           expected_ship_date: '2014-10-26',
                                           in_hand_date: '2014-10-26')
    @offer_scenario_z.status.should == 'Available'
  end

  # Modify Offer Non-Execution - Price: 120 Quantity: 1 - Proxy: 105
  it 'will succeed with the modification of an offer' do
    @offer_scenario_x_params = FactoryGirl.attributes_for(:offer, price: '170.00', quantity: 1, proxy: '125.00', multiple: 1)
    @offer_scenario_x = FactoryGirl.create(:offer, price: '170.00', quantity: 1, proxy: '125.00', multiple: 1)

    @offer_scenario_x.proxy = '120.00'
    @offer_scenario_x.save

    # Verify Bid modification saved successfully
    Offer.find(@offer_scenario_x.id).proxy.to_s.should == '120.0'
  end

  # Modify Offer Execution - Price: 90 - Quantity: 4 - Proxy: 0
  it 'will succeed with the modification of an offer and initiate sale' do
    @bid_scenario_a = FactoryGirl.create(:bid, price: '100.00', quantity: 4, proxy: '125.00')
    @offer_scenario_y_params = FactoryGirl.attributes_for(:offer, price: '100.00', quantity: 4)
    @offer_scenario_y = FactoryGirl.create(:offer, price: '165.00', quantity: 4, proxy: '120.00', multiple: 4, ticket_type_id: 2)

    # On bid modification, verify sale initiation was a success
    email_confirmation = Offer.modify_offer(@offer_scenario_y, @offer_scenario_y_params)
    email_confirmation[:status].should == 'Success'

    # Verify Bid modification saved successfully
    Offer.find(@offer_scenario_y.id).price.to_s.should == '95.0'
  end
end