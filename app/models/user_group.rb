class UserGroup < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_many :memberships
  validates :name, presence: true
  validates :admin, presence: true
end
