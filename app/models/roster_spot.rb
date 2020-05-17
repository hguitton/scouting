class RosterSpot < ApplicationRecord
  has_many :player_spots
  has_many :players, through: :player_spot
end
