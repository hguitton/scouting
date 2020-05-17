class Roster < ApplicationRecord
  has_and_belongs_to_many :players
  has_many :spots
  validates :name, presence: true
end
