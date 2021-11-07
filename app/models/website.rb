class Website < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :url, presence: true

  has_many :visits
end
