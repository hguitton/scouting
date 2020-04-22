class UpdatePlayersToRelations < ActiveRecord::Migration[6.0]
  def change
    remove_column :players, :priority
    remove_column :players, :status
    remove_column :players, :position

    add_reference :players, :priority, index: true
    add_reference :players, :status, index: true
    add_reference :players, :position, index: true
  end
end
