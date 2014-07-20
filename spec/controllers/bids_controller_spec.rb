require 'spec_helper'

describe BidsController do
  # Bid Execution - Price: 150 - Quantity: 2 - Proxy: 0
  it 'will succeed with the creation of a new bid' do
    @offer_scenario_z = FactoryGirl.create(:offer, price: '150.00', quantity: 4, proxy: '125.00', multiple: 2)

    # Enters a New bid
    # - Create the Bid
    # - Check if existing offers will allow for immediate sale
    # - Initiate Sale and execute offer Z at $150 by sending email to seller for confirmation
    @bid_scenario_1_params = FactoryGirl.attributes_for(:bid, price: '150.00', quantity: 2, proxy: '0.00')
    @bid_scenario_1 = FactoryGirl.create(:bid, price: '150.00', quantity: 2, proxy: '0.00')
    email_confirmation = Bid.create_bid(@bid_scenario_1_params)
    email_confirmation[:status].should == 'Success'

    # TODO: Create confirmation rspec test on the seller's acceptance for the last step:
    # Offer's Z's quantity will reduce to 2 and multiple will remain at 2
    # OfferTicket.response.should_be 2
  end

  # Enter a New Bid - Price: 130 - Quantity: 2 - Proxy: 140
  it 'will succeed with the creation of a new bid' do
    # Enters a New bid
    # - Create the Bid
    # - Check if existing offers will allow for immediate sale
    # - Initiate Sale and execute offer Z at $150 by sending email to seller for confirmation
    @bid_scenario_2_params = FactoryGirl.attributes_for(:bid, price: '130.00', quantity: 2, proxy: '140.00')
    @bid_scenario_2 = FactoryGirl.create(:bid, price: '130.00', quantity: 2, proxy: '140.00')
    email_confirmation = Bid.create_bid(@bid_scenario_2_params)
    email_confirmation[:status].should == 'Success'
  end

  # Modify Bid Non-Execution - Price: 120 - Quantity: 1 - Proxy: 150
  it 'will succeed with the modification of a bid' do
    @bid_scenario_b_params = FactoryGirl.attributes_for(:bid, price: '100.00', quantity: 1, proxy: '110.00')
    @bid_scenario_b = FactoryGirl.create(:bid, price: '100.00', quantity: 1, proxy: '110.00')

    @bid_scenario_b.proxy = '105.00'
    @bid_scenario_b.save

    # Verify Bid modification saved successfully
    Bid.find(@bid_scenario_b.id).proxy.to_s.should == '105.0'
  end

  # Modify Bid Execution - Price: 130 - Quantity: 2 - Proxy: 150
  it 'will succeed with the modification of a bid and initiate sale' do
    @offer_scenario_z = FactoryGirl.create(:offer, price: '150.00', quantity: 4, proxy: '125.00', multiple: 2)
    @bid_scenario_c_params = FactoryGirl.attributes_for(:bid, price: '130.00')
    @bid_scenario_c = FactoryGirl.create(:bid, price: '95.00', quantity: 2, proxy: '125.00')

    # On bid modification, verify sale initiation was a success
    email_confirmation = Bid.modify_bid(@bid_scenario_c, @bid_scenario_c_params)
    email_confirmation[:status].should == 'Success'

    # Verify Bid modification saved successfully
    Bid.find(@bid_scenario_c.id).price.to_s.should == '130.0'
  end
end