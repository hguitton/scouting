class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.integer :min_height
      t.integer :max_height
      t.integer :min_weight
      t.integer :max_weight
      t.integer :min_age
      t.integer :max_age
      t.integer :positions, array: true, default: [] 
      t.integer :profiles, array: true, default: [] 
      t.integer :statuses, array: true, default: [] 
      t.integer :available
      t.integer :min_salary
      t.integer :max_salary
      t.timestamps
    end
  end
end
