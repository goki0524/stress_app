class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.integer :department_id
      t.integer :employee_id

      t.timestamps
    end
    add_index :relationships, :department_id
    add_index :relationships, :employee_id
    add_index :relationships, [:department_id, :employee_id], unique: true
  end
end
