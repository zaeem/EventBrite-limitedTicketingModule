class VenueRow < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :venue_group
  belongs_to :venue_section
  has_many :offer_tickets
  validates :venue_section_id, presence: true
  validates :venue_group_id, presence: true
  validates :name, presence: true
  validates :seats, presence: true
end
