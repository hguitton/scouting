class CreatePlayersUsersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :players_users do |t|
      t.belongs_to :user
      t.belongs_to :player
      t.timestamps
    end
  end
end
