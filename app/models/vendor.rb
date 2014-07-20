class Vendor < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_many :vendor_events
  validates :name, presence: true
end
