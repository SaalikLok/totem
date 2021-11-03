class Website < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :url, presence: true

  has_many :visits
end
