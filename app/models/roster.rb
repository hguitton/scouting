class Roster < ApplicationRecord
  has_and_belongs_to_many :players
  has_many :roster_spots
  validates :name, presence: true
end
