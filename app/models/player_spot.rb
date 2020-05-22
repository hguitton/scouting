class PlayerSpot < ApplicationRecord
  belongs_to :player
  belongs_to :roster_spot

  delegate :id, :name, to: :player, prefix: true
end
