class ChangeAvailableType < ActiveRecord::Migration[6.0]
  def change
    change_column :players, :available, :string
  end
end
