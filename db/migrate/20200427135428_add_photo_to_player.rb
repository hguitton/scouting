class AddPhotoToPlayer < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :photo, :string
  end
end
