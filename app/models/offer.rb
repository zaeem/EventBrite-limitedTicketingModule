class Offer < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :user
  belongs_to :venue_group
  belongs_to :event
  belongs_to :ticket_type
  has_many :offer_tickets
  has_many :sales
  has_many :offer_disclosures
  has_many :negotiation_logs
  validates :venue_group_id, presence: true
  validates :event_id, presence: true
  validates :user_id, presence: true
  validates :ticket_type_id, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :multiple, presence: true
  validates :status, presence: true
  validates :in_hand_date, presence: true
  validates :expected_ship_date, presence: true
  validates :is_negotiation, :inclusion => { :in => [true, false] }
  validates :confirm_transaction, presence: true
  validates :piggy_backed, :inclusion => { :in => [true, false] }

  def self.check_for_immediate_offer(bid)
    # If offers exist within the price and quantity range return array of immediate offers available
    offer = Offer.where(:event_id => bid.event_id).
                  where(:venue_group_id => bid.venue_group_id).
                  where('price <= (?)', bid.price).
                  where('quantity >= (?)', bid.quantity).first
    if !offer.present?
      offer = Offer.where(:event_id => bid.event_id).
                    where(:venue_group_id => bid.venue_group_id).
                    where('proxy <= (?)', bid.price).
                    where('quantity >= (?)', bid.quantity).first
    end

    offer
  end

  def self.calculate_offer_price(price,quantity,sale_fee,shipping_fee)
    sale_fee = BigDecimal.new(sale_fee) / quantity
    shipping_fee = BigDecimal.new(shipping_fee) / quantity
    calculated_price = BigDecimal.new(price) - sale_fee - shipping_fee
  end

  def self.create_offer(params)
     # TODO: Verify valid CC on file for the selling user or return no valid cc on file
     # TODO: Pre-authorize the credit card for the total amount to be charged: (price x qty of tickets) +
     #        fee (price x qty of tickets) or return insufficient funds

    offer = Offer.create(params)
    if offer.present?
      # Process site fees from setting table entry
      sale_fee = Setting.retrieve('sale_fee')
      shipping_fee = params[:ticket_type_id] == 1 ? Setting.retrieve('shipping_fee') : 0
      price = calculate_offer_price(offer.price, offer.quantity, sale_fee,shipping_fee)
      offer.price = price

      # Store new offer tickets in offer table
      offer.quantity.times do
        offer_ticket_params = {:offer_id => offer.id,
                               :venue_row_id => 1, # TODO Need to calculate venue rows, groups, etc for seats
                               :status => 'Available',
                               :seat_number => '1',  # TODO Need to calculate venue rows, groups, etc for seats
                               :barcode => 'XYZ', # TODO Need to implement for Adobe PDF ticket reader
                               :attendee_name => ''
        }
        OfferTicket.create(offer_ticket_params)
      end

      # Check_for_immediate_bids() if exists process_sale
      if Bid.check_for_immediate_bid(offer).present?
        bid = Bid.check_for_immediate_bid(offer)
        response = Sale.process_sale(bid, offer)
      else
        if params[:is_negotiation]
          user = User.find_by_id(params[:user_id])
          event_name = Event.find_by_id(params[:event_id]).name

          negotiation_log_params = {:bid_id => params[:bid_id],
                                    :offer_id => params[:offer_id],
                                    :price => price,
                                    :quantity => params[:quantity],
                                    :negotiation_type => params[:negotiation_type]}
          if NegotiationLog.create('negotiation_log_params' => negotiation_log_params).valid?
            NegotiationLog.create('negotiation_log_params' => negotiation_log_params)

            # Email Buyer about new negotiation bid
            response = send_email('Slicket Ticket Negotition',
                                  'The sellers response to your negotiation offer of' + params[:price] + '. Please return to Slicket Ticket.com to respond to this negotiation bid.',
                                  'negotiation_response',
                                  {:first_name => user.first_name,
                                   :last_name => user.last_name,
                                   :email => user.email,
                                   :price => price,
                                   :event_name => event_name})
          else
            errors = []
            response = {:status => 'Unsuccessful', :errorMessageList => errors}
          end
        else
          response = {:status => 'Success'}
        end
      end
    else
      errors = []
      response = {:status => 'Unsuccessful', :errorMessageList => errors}
    end
    #response
  end

  def self.modify_offer(offer,params)
    # TODO: Verify valid CC on file for the bidding user or return no valid cc on file
    # TODO: Pre-authorize the credit card for the total amount to be charged: (price x qty of tickets) + fee (price x qty of tickets) or return insufficient funds

    # Process site fees from setting table entry
    sale_fee = Setting.retrieve('sale_fee')
    shipping_fee = params[:ticket_type_id] == 1 ? Setting.retrieve('shipping_fee') : 0
    price = params[:price].present? ? params[:price] : offer.price
    quantity = params[:quantity].present? ? params[:quantity] : offer.quantity

    # If price or quantity change, check_for_immediate_offers() if exists process_sale
    if offer.price != price || offer.quantity != quantity
      price = calculate_offer_price(price,quantity,sale_fee,shipping_fee)
      offer.price = price
      offer.quantity = quantity
      offer.save

      if Bid.check_for_immediate_bid(offer).present?
        bid = Bid.check_for_immediate_bid(offer)
        response = Sale.initiate_sale(bid)
      end
    else
      if params[:is_negotiation]
        user = User.find_by_id(params[:user_id])
        event_name = Event.find_by_id(params[:event_id]).name

        negotiation_log_params = {:bid_id => params[:bid_id],
                                  :offer_id => params[:offer_id],
                                  :price => price,
                                  :quantity => params[:quantity],
                                  :negotiation_type => params[:negotiation_type]}
        log_entry = NegotiationLog.new('negotiation_log_params' => negotiation_log_params)
        if log_entry.valid?
          log_entry.save

          # Email Buyer about new negotiation bid
          response = send_email('Slicket Ticket Negotition',
                                'The sellers response to your negotiation offer of' + params[:price] + '. Please return to Slicket Ticket.com to respond to this negotiation bid.',
                                'negotiation_response',
                                {:first_name => user.first_name,
                                 :last_name => user.last_name,
                                 :email => user.email,
                                 :price => price,
                                 :event_name => event_name})
        else
          errors = []
          response = {:status => 'Unsuccessful', :errorMessageList => errors}
        end
      else
        errors = []
        response = {:status => 'Unsuccessful', :errorMessageList => errors}
      end
    end
    response
  end
end