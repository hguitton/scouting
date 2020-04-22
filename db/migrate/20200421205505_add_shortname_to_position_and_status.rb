class AddShortnameToPositionAndStatus < ActiveRecord::Migration[6.0]
  def change
    add_column :positions, :short, :string
    add_column :statuses, :short, :string
  end
end
