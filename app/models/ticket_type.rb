class TicketType < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_many :bid_ticket_types
  has_many :offers
  validates :id, presence: true
  validates :name, presence: true
end
