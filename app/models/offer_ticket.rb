class OfferTicket < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :offer
  belongs_to :sale
  belongs_to :venue_row
  has_many :uploaded_tickets
  validates :offer_id, presence: true
  validates :venue_row_id, presence: true
  validates :status, presence: true
  validates :seat_number, presence: true
end
