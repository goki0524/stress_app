class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :company_email
      t.integer :department_number
      t.integer :employee_number

      t.timestamps
    end
  end
end
