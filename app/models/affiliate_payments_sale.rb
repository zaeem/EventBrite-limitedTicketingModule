class AffiliatePaymentsSale < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :sale
  belongs_to :affiliate_payment
  validates :affiliate_payment_id, presence: true
  validates :sale_id, presence: true
end
