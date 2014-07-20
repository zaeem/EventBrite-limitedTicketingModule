class Disclosure < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_many :offer_disclosures
  validates :name, presence: true
end
