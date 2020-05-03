class AddDefaultValuesForPlayers < ActiveRecord::Migration[6.0]
  def change
    change_column_default :players, :height_eu, value: 0
    change_column_default :players, :weight_eu, value: 0
  end
end
