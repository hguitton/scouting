class AddPriorityToPlayer < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :priority, :string
  end
end
