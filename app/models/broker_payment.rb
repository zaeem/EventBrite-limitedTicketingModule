class BrokerPayment < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_many :broker_payments_sales
  validates :amount, presence: true
  validates :payment_type, presence: true
  validates :status, presence: true
end
