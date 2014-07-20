class BrokerDetail < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :user
  validates :user_id, presence: true
  validates :reduction_percentage, presence: true
  validates :reduction_flat_fee, presence: true
  validates :reduction_type, presence: true
  validates :payment_threshold, presence: true
  validates :locked, :inclusion => { :in => [true, false] }
  validates :payment_method, presence: true
  validates :payments_active, :inclusion => { :in => [true, false] }
end
