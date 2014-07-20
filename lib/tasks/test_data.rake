namespace :app do
  desc <<-DESC
    Load testing data.
    Run using the command 'rake app:load_demo_data'
  DESC
  task :load_demo_data => [:environment] do

    # Only data not required in production should be here.
    # If it needs to be there in production, it belongs in seeds.rb.

    User.delete_all
    Address.delete_all
    AffiliateDetail.delete_all
    AffiliatePayment.delete_all
    AffiliatePaymentsSale.delete_all
    BidTicketType.delete_all
    Bid.delete_all
    BrokerDetail.delete_all
    BrokerPayment.delete_all
    BrokerPaymentsSale.delete_all
    CouponCode.delete_all
    CreditCard.delete_all
    Disclosure.delete_all
    Event.delete_all
    Membership.delete_all
    NegotiationLog.delete_all
    OfferTicket.delete_all
    OfferTicket.delete_all
    Offer.delete_all
    Payment.delete_all
    Sale.delete_all
    Setting.delete_all
    TicketStatus.delete_all
    TicketType.delete_all
    UploadedTicket.delete_all
    UserGroup.delete_all
    VendorEvent.delete_all
    Vendor.delete_all
    VenueGroup.delete_all
    VenueRow.delete_all
    VenueSection.delete_all
    Venue.delete_all
    EventDisclosure.delete_all

    User.create(email: 'rich.massa@gmail.com', username: 'Rich', password: 'password', title: 'Mr.', first_name: 'Rich', last_name: 'Massa', phone: '1231231234', phone_daytime: '1231231234', phone_evening: '1231231234', subscribe: 0, sale_commission: 1, negotiation_commission: 2)
    User.create(email: 'AxelGuiloff@gmail.com', username: 'Axel', password: 'password', title: 'Mr.', first_name: 'Axel', last_name: 'Guiloff', phone: '1231231234', phone_daytime: '1231231234', phone_evening: '1231231234', subscribe: 0, sale_commission: 1, negotiation_commission: 2)
    User.create(email: 'jgray@slicket.com', username: 'Jeff', password: 'password', title: 'Mr.', first_name: 'Jeff', last_name: 'Gray', phone: '1231231234', phone_daytime: '1231231234', phone_evening: '1231231234', subscribe: 0, sale_commission: 1, negotiation_commission: 2)
    Address.create(user_id: 1, address_type: 'Residential', name: 'Home', address1: '123 Test Street', address2: '', city: 'Estero', state: 'FL',phone: '1231231234')
    AffiliateDetail.create(user_id: 1, percentage: 3,flat_fee: 10, commissionable_type: 'Direct', payment_threshold: 1, locked: false, payment_method: 'Check', affiliate_token: 1, token_active: false, payments_active: false)
    AffiliatePayment.create(user_id: 1, amount: '100', affiliate_type: 'Online', status: 'Pending')
    AffiliatePaymentsSale.create(affiliate_payment_id: 1, sale_id: 1)
    BidTicketType.create(bid_id: 1, ticket_type_id: 1)
    Bid.create(event_id: 1, user_id: 1, venue_group_id: 1, price: 85.00, quantity: 2, proxy: false, expires_at: '', cancel_others: true, status: 'Available', in_hand_date: DateTime.now, is_negotiation: false, expected_ship_date: DateTime.new)
    BrokerDetail.create(user_id: 1, kickback_percentage: 5.0, kickback_flat_fee: 5.0, kickback_type: 'Direct', reduction_percentage: 1, reduction_flat_fee: 5, reduction_type: '', payment_threshold: 100, locked: false, payment_method: 'Check', payments_active: false)
    BrokerPayment.create(amount: 30.00, payment_type: 'Check', status: 'Pending')
    BrokerPaymentsSale.create(broker_payment_id: 1, sale_id: 1)
    CouponCode.create(code: 'BOGO', discount_type: 'Percent', amount: 50.00, quantity: 1, starts_at: DateTime.now, expires_at: DateTime.new)
    CreditCard.create(user_id: 1, address_id: 1, first_name: 'Rich', last_name: 'Massa', number: '4111111111111111', expiration_month: 5, expiration_year: 2017, ccv: 123)
    Disclosure.create(name: 'No Alcohol Section')
    Event.create(venue_id: 1, name: 'Joe Robbie Stadium', event_date: DateTime.new('01/11/2017'), description: 'Stadium', primary: true, primary_pdf: '', seatgeek_id: '123')
    Membership.create(user_id: 1, user_group_id: 1, created_by: 1)
    NegotiationLog.create(bid_id: 1, offer_id: 1, price: 70.00, quantity: 2, negotiation_type: '')
    OfferDisclosure.create(offer_id: 1, disclosure_id: 1)
    OfferTicket.create(offer_id: 1, venue_row_id: 1, sale_id: 1, status: 'Available', seat_number: 15, barcode: '123XYZ', attendee_name: 'Joe Robbie')
    Offer.create(event_id: 1, user_id: 1, venue_group_id: 1, ticket_type_id: 1, price: 100.00, quantity: 2, proxy: '', multiple: 0, cancel_others: false, status: 'Pending', in_hand_date: DateTime.now, expected_ship_date: DateTime.now, is_negotiation: false, expires_at: DateTime.new('01/11/2016'), confirm_transaction: true, piggy_backed: false, notes: '')
    Payment.create(sale_id: 1, payment_type: 'Check', amount: 200.00)
    Sale.create(bid_id: 1, offer_id: 1, ticket_status_id: 1, quantity: 2, price: 185.00, affiliate_id: nil, payment_status: 'Paid', coupon_code_id: nil)
    Setting.create(name: 'shipping_fee', value: '10')
    TicketStatus.create(name: 'Available')
    TicketType.create(name: 'Hard')
    UploadedTicket.create(offer_ticket_id: 1, ticket_file: '')
    UserGroup.create(name: 'Admins', admin: true)
    VendorEvent.create(event_id: 1, vendor_id: 1)
    Vendor.create(name: 'Test Vendor')
    VenueGroup.create(name: 'Lower Corner', rating: 3.5, venue_id: 1)
    VenueRow.create(venue_section_id: 1, venue_group_id: 1, name: 'Middle', seats: 1)
    VenueSection.create(venue_id: 1, raphael_date: DateTime.now, color: 'Blue', section_text: 'Corners', section_number: '110', row_start: 1, row_end: 10, photo: 'image.png')
    Venue.create(category: 'Football', subcategory: 'NFL', name: 'Miami', team: 'Dolphins', street_address: '123 Test Street', city: 'Miami', state: 'FL', zip: '33928', phone: '1231231234', description: '', school: '', team_name: 'Dolphins', mascot: 'Dolphin', seatgeek_id: '123', photo: 'image.png')
    EventDisclosure.create(event_id: 1, disclosure_id: 1, venue_section_integer: 1)
  end
end