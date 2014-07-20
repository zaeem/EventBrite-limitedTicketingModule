class CouponCode < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  validates :code, presence: true
  validates :discount_type, presence: true
  validates :amount, presence: true
  validates :quantity, presence: true
  validates :starts_at, presence: true
  validates :expires_at, presence: true
end
