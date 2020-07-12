class Offer < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :url, url: { no_local: true }
  validates_length_of :description, maximum: 500, allow_blank: false
  validates :starts_at, presence: true

  def status
    (self.is_enabled?) ? 'enabled' : 'disabled'
  end

  def is_enabled?
    current_time = Time.now
    ends_at = (self.ends_at.present?) ? self.ends_at : current_time + 1.day
    
    !self.force_disabled && current_time.between?(self.starts_at, ends_at)
  end
end
