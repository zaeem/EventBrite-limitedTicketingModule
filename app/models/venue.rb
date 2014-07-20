class Venue < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_many :venue_groups
  has_many :venue_sections
  has_many :events
  validates :category, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :subcategory, presence: true

  def self.search(query)
    words = query.to_s.downcase.strip.split.uniq
    words.inject(scoped) do |combined_scope, word|
      combined_scope.where("name LIKE ?", "%#{word}%")
    end
  end
end
