class BrokerPaymentsSale < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :sale
  belongs_to :broker_payment
  validates :broker_payment_id, presence: true
  validates :sale_id, presence: true
end
