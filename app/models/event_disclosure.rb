class EventDisclosure < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  validates :event_id, presence: true
  validates :disclosure_id, presence: true
  validates :venue_section_id, presence: true
end
