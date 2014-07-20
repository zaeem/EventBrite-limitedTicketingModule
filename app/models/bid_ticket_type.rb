class BidTicketType < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :bid
  belongs_to :ticket_type
  validates :bid_id, presence: true
  validates :ticket_type_id, presence: true
end
