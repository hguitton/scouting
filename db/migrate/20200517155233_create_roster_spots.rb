class CreateRosterSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :roster_spots do |t|
      t.string :name
      t.belongs_to :roster
      t.belongs_to :position
      t.string :price
      t.string :minutes
      t.timestamps
    end
  end
end
