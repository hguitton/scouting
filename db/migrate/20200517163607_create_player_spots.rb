class CreatePlayerSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :player_spots do |t|
      t.belongs_to :roster_spot
      t.belongs_to :player
      t.integer :order
      t.timestamps
    end
  end
end
