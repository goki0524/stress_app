class CreateProjectValues < ActiveRecord::Migration[5.1]
  def change
    create_table :project_values do |t|
      t.integer :project_id
      t.integer :value_id

      t.timestamps
    end
    add_index :project_values, :project_id
    add_index :project_values, :value_id
    add_index :project_values, [:project_id, :value_id], unique: true
  end
end
