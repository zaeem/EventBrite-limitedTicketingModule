class UploadedTicket < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :offer_ticket
  validates :offer_ticket_id, presence: true
  validates :ticket_file, presence: true
end
