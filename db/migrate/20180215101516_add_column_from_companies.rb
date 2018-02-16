class AddColumnFromCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :all_employee_number, :integer
  end
end
