class AddBirthdateTimestamp < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :birthdate_timestamp, :timestamp
  end
end
