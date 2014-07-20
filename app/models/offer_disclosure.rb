class OfferDisclosure < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :offer
  belongs_to :disclosure
  validates :offer_id, presence: true
  validates :disclosure_id, presence: true
end
