class CreateDepartments < ActiveRecord::Migration[5.1]
  def change
    create_table :departments do |t|
      t.string :department_name
      t.integer :employee_number
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
