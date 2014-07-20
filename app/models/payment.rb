class Payment < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  validates :sale_id, presence: true
  validates :payment_type, presence: true
  validates :amount, presence: true
  validates :created_at, presence: true
  validates :updated_at, presence: true
end
