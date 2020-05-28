class CreateRosters < ActiveRecord::Migration[6.0]
  def change
    create_table :rosters do |t|
      t.string :name
      t.string :description
      t.belongs_to :user
      t.timestamps
    end

    create_table :players_rosters do |t|
      t.belongs_to :roster
      t.belongs_to :player
      t.timestamps
    end
  end
end
