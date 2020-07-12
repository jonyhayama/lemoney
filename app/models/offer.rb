class Offer < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :url, url: { no_local: true }
  validates_length_of :description, maximum: 500, allow_blank: false
  validates :starts_at, presence: true
end
