class RemoveColumnFromCompanies < ActiveRecord::Migration[5.1]
  def change
    remove_column :companies, :employee_number, :integer
    remove_column :companies, :department_number, :integer
  end
end
