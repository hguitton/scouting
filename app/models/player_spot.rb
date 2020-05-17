class PlayerSpot < ApplicationRecord
  belongs_to :players
  belongs_to :roster_spot
end
