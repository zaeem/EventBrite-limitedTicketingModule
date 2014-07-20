class AffiliatePayment < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :user
  has_many :affiliate_payments_sales
  validates :user_id, presence: true
  validates :amount, presence: true
  validates :affiliate_type, presence: true
  validates :status, presence: true
end
