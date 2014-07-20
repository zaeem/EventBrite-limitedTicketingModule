class NegotiationLog < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :offer
  belongs_to :bid
  validates :bid_id, presence: true
  validates :offer_id, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :negotiation_type, presence: true
  validates :created_at, presence: true
end
