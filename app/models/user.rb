class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_many :broker_details
  has_many :affiliate_payments
  has_many :affiliate_details
  has_many :addresses
  has_many :memberships
  has_many :credit_cards
  has_many :bids
  has_many :offers
  has_many :sales

  validates :first_name,  presence: true
  validates :last_name,   presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :phone, presence: true
  validates :subscribe, :inclusion => { :in => [true, false] }
  validates :security_question1, presence: true
  validates :security_answer1, presence: true
  validates :sale_commission, presence: true
  validates :negotiation_commission, presence: true
end
