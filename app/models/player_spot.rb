class PlayerSpot < ApplicationRecord
  belongs_to :player
  belongs_to :roster_spot
end
