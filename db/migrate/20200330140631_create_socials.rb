class CreateSocials < ActiveRecord::Migration[6.0]
  def change
    create_table :socials do |t|
      t.string :link
      t.belongs_to :player
      t.timestamps
    end
  end
end
