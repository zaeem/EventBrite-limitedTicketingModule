class Address < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :user
  has_many :credit_cards
  validates :user_id,  presence: true
  validates :address_type,   presence: true
  validates :name, presence: true
  validates :address1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :phone, presence: true
end
