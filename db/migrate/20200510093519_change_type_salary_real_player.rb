class ChangeTypeSalaryRealPlayer < ActiveRecord::Migration[6.0]
  def change
    change_column :players, :salary_real, "integer USING NULLIF(salary_real, '')::int"
  end
end
