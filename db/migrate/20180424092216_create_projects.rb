class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.references :company, foreign_key: true
      t.integer :employee_number
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
    add_index :projects, [:company_id, :created_at]
  end
end
