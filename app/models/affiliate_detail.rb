class AffiliateDetail < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :user
  validates :user_id, presence: true
  validates :percentage, presence: true
  validates :flat_fee, presence: true
  validates :commissionable_type, presence: true
  validates :payment_threshold, presence: true
  validates :locked, :inclusion => { :in => [true, false] }
  validates :payment_method, presence: true
  validates :affiliate_token, presence: true
  validates :token_active, :inclusion => { :in => [true, false] }
  validates :payments_active, :inclusion => { :in => [true, false] }
end
