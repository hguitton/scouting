class RosterSpot < ApplicationRecord
  belongs_to :position
  has_many :player_spots
  has_many :players, through: :player_spots
end
