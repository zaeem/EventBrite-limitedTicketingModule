class Event < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :venue
  has_many :vendor_events
  has_many :bids
  has_many :offers
  validates :venue_id, presence: true
  validates :event_date, presence: true
  validates :name, presence: true

  def self.search(query)
    words = query.to_s.downcase.strip.split.uniq
    words.inject(all) do |combined_scope, word|
      combined_scope.where('name LIKE ?', "%#{word}%")
    end
  end
end
