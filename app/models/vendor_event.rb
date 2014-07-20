class VendorEvent < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :event
  belongs_to :vendor
  validates :event_id, presence: true
  validates :vendor_id, presence: true
end
