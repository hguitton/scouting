class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :lastname
      t.string :firstname
      t.string :birthdate
      t.string :status
      t.string :nationality
      t.string :agent_fr
      t.string :agent_us
      t.string :position
      t.string :height_us
      t.integer :height_eu
      t.integer :weight_us
      t.integer :weight_eu
      t.string :salary
      t.boolean :available
      t.timestamps
    end
  end
end
