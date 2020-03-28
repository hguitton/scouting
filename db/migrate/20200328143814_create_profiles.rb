class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.timestamps
    end

    create_table :players_profiles, id: false do |t|
      t.belongs_to :player
      t.belongs_to :profile
    end
  end
end
