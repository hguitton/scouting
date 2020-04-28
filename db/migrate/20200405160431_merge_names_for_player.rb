class MergeNamesForPlayer < ActiveRecord::Migration[6.0]
  def change
    rename_column :players, :lastname, :name
    remove_column :players, :firstname, :string
  end
end
