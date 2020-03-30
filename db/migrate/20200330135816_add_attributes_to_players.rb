class AddAttributesToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :program, :string
    add_column :players, :salary_real, :string
    rename_column :players, :salary, :salary_estimation
    add_column :players, :links, :string
    add_reference :players, :level, index: true
    add_reference :players, :updated_by_user, index: true
  end
end
