class CreateSeasons < ActiveRecord::Migration[6.0]
  def change
    create_table :seasons do |t|
      t.belongs_to :player
      t.belongs_to :user
      t.string :name
      t.string :team
      t.string :country
      t.string :min
      t.string :points
      t.string :fgp
      t.string :three_fgp
      t.string :orb
      t.string :drb
      t.string :trb
      t.string :ast
      t.string :blk
      t.string :stl
      t.timestamps
    end
  end
end
