class CreditCard < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :address
  belongs_to :user
  validates :user_id, presence: true
  validates :address_id, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :number, presence: true
  validates :expiration_month, presence: true
  validates :expiration_year, presence: true
  validates :ccv, presence: true
end
