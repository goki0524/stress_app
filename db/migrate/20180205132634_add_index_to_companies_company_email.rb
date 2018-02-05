class AddIndexToCompaniesCompanyEmail < ActiveRecord::Migration[5.1]
  def change
    add_index :companies, :company_email, unique: true
  end
end
