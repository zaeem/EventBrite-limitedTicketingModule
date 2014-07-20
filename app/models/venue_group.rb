class VenueGroup < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :venue
  has_many :venue_rows
  has_many :bids
  has_many :offers
  validates :name, presence: true
  validates :rating, presence: true
  validates :venue_id, presence: true
end
