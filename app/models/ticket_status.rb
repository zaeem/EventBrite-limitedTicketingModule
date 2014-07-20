class TicketStatus < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_many :sale
  validates :name, presence: true
end
