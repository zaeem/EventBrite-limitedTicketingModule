class VenueSection < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :venue
  has_many :venue_rows
  validates :venue_id, presence: true
  validates :raphael_date, presence: true
  validates :color, presence: true
  validates :section_number, presence: true
  validates :row_end, presence: true
  validates :row_start, presence: true
end
