class Sale < ActiveRecord::Base
  require 'emailmailer.rb'
  include EmailMailer
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :offer
  belongs_to :bid
  belongs_to :ticket_status
  belongs_to :user
  has_many :broker_payments_sales
  has_many :affiliate_payments_sales
  has_many :offer_tickets
  validates :bid_id, presence: true
  validates :offer_id, presence: true
  validates :ticket_status_id, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
  validates :payment_status, presence: true

  def self.initiate_sale(params)
    #user = User.find_by_id(params[:user_id])
    # Email seller to confirm sale
    # TODO: Fix send_mailer to work in local development mode
    response = {:status => 'Success'}
    #response = send_email('Slicket Ticket Sale Pending',
    #                      'A bidder has accepted your offer of' + params[:price] + '. Please return to Slicket Ticket.com to respond and confirm this sale.',
    #                      'confirm_sale',
    #                      {:first_name => user.first_name,
    #                       :last_name => user.last_name,
    #                       :email => user.email,
    #                       :price => params[:price],
    #                       :event_name => ''})
  end

  def self.process_sale(bid,offer)
    errors = []
    offer_seats = OfferTicket.where(:offer_id => offer.id)

    # Check that quantity is available in offer_tickets and transaction offer
    unless bid.quantity >= offer.quantity && bid.quantity >= offer_seats.length
      errors.push({:message => 'Sale not processed. Quantity unavailable.'})
      response = {:status => 'Unsuccessful', :errorMessageList => errors}
      return response
    end

    # Check if bid/offer not rejected and not sale pending only available
    unless offer.status == 'Approved' && bid.status == 'Approved'
      errors.push({:message => 'Sale not processed. Offer or bid not approved.'})
      response = {:status => 'Unsuccessful', :errorMessageList => errors}
      return response
    end

    # Check if time for proxy not expired (exp date/time is on bid and offer?)
    unless bid.expires_at < DateTime.now
      errors.push({:message => 'Sale not processed. Date expired.'})
      response = {:status => 'Unsuccessful', :errorMessageList => errors}
      return response
    end

    # Double Check no previous sale is pending
    sales = Sale.where(:event_id => params[:event_id],
                       :venue_group_id => params[:venue_group_id],
                       :venue_row_id => params[:venue_row_id],
                       :venue_section_id => params[:venue_section_id])

    unless sales.empty?
      errors.push({:message => 'Sale not processed. Previous sale pending.'})
      response = {:status => 'Unsuccessful', :errorMessageList => errors}
      return response
    end

    # Save sale of an Accepted offer
    sale_params = {:bid_id => params[:bid_id],
                   :offer_id => offer.id,
                   :ticket_status_id => '1',
                   :quantity => params[:quantity],
                   :price => params[:price],
                   :affiliate_id => params[:affiliate_id],
                   :payment_status => 'Pending',
                   :coupon_code_id => params[:coupon_code_id]}
    sale = Sale.create('sale' => sale_params)
    unless sale.save
      errors.push({:message => 'Sale not processed.'})
      response = {:status => 'Unsuccessful', :errorMessageList => errors}
      return response
    end

    # After sale, update offer_seats and quantity on offers
    offer_seats.quantity = offer_seats.quantity - bid.quantity
    offer_seats.status = 'Sold'
    offer_seats.save

    offer.quantity = offer.quantity - bid.quantity
    offer.save

    response = {:status => 'Successful'}
    return response
  end
end
