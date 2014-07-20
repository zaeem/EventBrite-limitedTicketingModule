class Membership < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :user
  belongs_to :user_group
  validates :user_id, presence: true
  validates :user_group_id, presence: true
end
