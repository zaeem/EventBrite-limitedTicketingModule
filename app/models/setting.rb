class Setting < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  validates :name, presence: true
  validates :value, presence: true

  def self.retrieve(key)
    setting = Setting.where(:name => key).first
    value = setting['value']
    return value.length > 0 ? value : false
  end
end
