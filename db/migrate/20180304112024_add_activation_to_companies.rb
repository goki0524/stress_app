class AddActivationToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :activation_digest, :string
    add_column :companies, :activated, :boolean, default: false
    add_column :companies, :activated_at, :datetime
  end
end
