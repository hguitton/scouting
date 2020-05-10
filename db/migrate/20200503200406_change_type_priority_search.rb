class ChangeTypePrioritySearch < ActiveRecord::Migration[6.0]
  def change
    remove_column :searches, :priorities
    add_column :searches, :priorities, :integer, array: true, default: []
  end
end
