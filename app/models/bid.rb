class Bid < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :event
  belongs_to :user
  belongs_to :venue_group
  has_many :bid_ticket_types
  has_many :negotiation_logs
  has_many :sales
  validates :venue_group_id, presence: true
  validates :event_id, presence: true
  validates :user_id, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :status, presence: true
  validates :is_negotiation, :inclusion => { :in => [true, false] }

  def self.check_for_immediate_bid(offer)
    # If bids exist within the price and quantity range return array of immediate bids available
    bid = self.where(:event_id => offer.event_id).
               where(:venue_group_id => offer.venue_group_id).
               where('price > (?)', offer.price).
               where('quantity <= (?)', offer.quantity).first # Order by date, first bid to be accepted
    if !bid.present?
      bid = self.where(:event_id => offer.event_id).
                 where(:venue_group_id => offer.venue_group_id).
                 where('proxy > (?)', offer.price).
                 where('quantity <= (?)', offer.quantity).first # Order by date, first bid to be accepted
    end

    bid
  end

  def self.calculate_bid_price(bid)
    # Sale/Shipping fee will only be calculated on the offer so not to calculate twice
    #sale_fee = BigDecimal.new(sale_fee) / bid.quantity
    #shipping_fee = BigDecimal.new(shipping_fee) / bid.quantity
    calculated_price = BigDecimal.new(bid.price)
    #calculated_price = BigDecimal.new(bid.price) - sale_fee - shipping_fee
  end

  def self.create_bid(params)
    # TODO: Verify valid CC on file for the bidding user or return no valid cc on file
    # TODO: Pre-authorize the credit card for the total amount to be charged: (price x qty of tickets) +
    #        fee (price x qty of tickets) or return insufficient funds

    bid = Bid.create(params)
    if bid.present?
      # Check_for_immediate_offers() if exists process_sale
      offer = Offer.check_for_immediate_offer(bid)
      if offer.present?
        response = Sale.initiate_sale(params)
      else
        if params[:is_negotiation]
          user = User.find_by_id(params[:user_id])
          event_name = Event.find_by_id(params[:event_id]).name

          # Process site fees from setting table entry
          # Sale/Shipping fee will only be calculated on the offer so not to calculate twice
          #sale_fee = Setting.retrieve('sale_fee')
          #shipping_fee = params[:ticket_type_id] == 1 ? Setting.retrieve('shipping_fee') : 0
          price = calculate_bid_price(bid)
          bid.price = price

          negotiation_log_params = {:bid_id => params[:bid_id],
                                    :offer_id => params[:offer_id],
                                    :price => price,
                                    :quantity => params[:quantity],
                                    :negotiation_type => params[:negotiation_type]}
          if NegotiationLog.create('negotiation_log_params' => negotiation_log_params).valid?
            NegotiationLog.create('negotiation_log_params' => negotiation_log_params)

            # Email Seller about new negotiation bid
            response = send_email('Slicket Ticket Negotition',
                                  'Your tickets for '+event_name+'have a bidders negotiation offer of'+params[:price]+'. Please return to Slicket Ticket.com to respond to this negotiation bid.',
                                  'new_negotiation',
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
          response = {:status => 'Success', :bid => bid}
        end
      end
    else
      errors = []
      response = {:status => 'Unsuccessful', :errorMessageList => errors}
    end
    response
  end

  def self.modify_bid(bid,params)
    # TODO: Verify valid CC on file for the bidding user or return no valid cc on file
    # TODO: Pre-authorize the credit card for the total amount to be charged: (price x qty of tickets) + fee (price x qty of tickets) or return insufficient funds

    # Process site fees from setting table entry
    # Sale/Shipping fee will only be calculated on the offer so not to calculate twice
    #sale_fee = Setting.retrieve('sale_fee')
    #shipping_fee = params[:ticket_type_id] == 1 ? Setting.retrieve('shipping_fee') : 0
    #price = calculate_bid_price(bid)
    price = params[:price].present? ? params[:price] : bid.price
    quantity = params[:quantity].present? ? params[:quantity] : bid.quantity

    # If price or quantity change, check_for_immediate_offers() if exists process_sale
    if bid.price != price || bid.quantity != params[:quantity]
      bid.price = price
      bid.quantity = quantity
      bid.save

      if Offer.check_for_immediate_offer(bid).present?
        offer = Offer.check_for_immediate_offer(bid)
        response = Sale.initiate_sale(offer)
      end
    else
      if Bid.update_attributes(params)
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

            # Email Bidder about new negotiation bid
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
    end
    response
  end
end
