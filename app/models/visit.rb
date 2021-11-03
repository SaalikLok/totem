class Visit < ApplicationRecord
  validates :full_url, presence: true
  validates :host, presence: true
  validates :pathname, presence: true

  belongs_to :website
end
