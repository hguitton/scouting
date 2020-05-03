class AddPrioritiesToSearch < ActiveRecord::Migration[6.0]
  def change
    add_column :searches, :priorities, :string, array: true, default: []
    remove_column :searches, :available
    add_column :searches, :available, :string, array: true, default: []
  end
end
