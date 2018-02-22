class CreateValues < ActiveRecord::Migration[5.1]
  def change
    create_table :values do |t|
      t.references :employee, foreign_key: true
      t.integer :a1
      t.integer :a2
      t.integer :a3
      t.integer :a4
      t.integer :a5
      t.integer :a6
      t.integer :a7
      t.integer :a8
      t.integer :a9
      t.integer :a10
      t.integer :a11
      t.integer :a12
      t.integer :a13
      t.integer :a14
      t.integer :a15
      t.integer :a16
      t.integer :a17
      t.integer :b1
      t.integer :b2
      t.integer :b3
      t.integer :b4
      t.integer :b5
      t.integer :b6
      t.integer :b7
      t.integer :b8
      t.integer :b9
      t.integer :b10
      t.integer :b11
      t.integer :b12
      t.integer :b13
      t.integer :b14
      t.integer :b15
      t.integer :b16
      t.integer :b17
      t.integer :b18
      t.integer :b19
      t.integer :b20
      t.integer :b21
      t.integer :b22
      t.integer :b23
      t.integer :b24
      t.integer :b25
      t.integer :b26
      t.integer :b27
      t.integer :b28
      t.integer :b29
      t.integer :c1
      t.integer :c2
      t.integer :c3
      t.integer :c4
      t.integer :c5
      t.integer :c6
      t.integer :c7
      t.integer :c8
      t.integer :c9
      t.integer :d1
      t.integer :d2

      t.timestamps
    end
    add_index :values, [:employee_id, :created_at]
  end
end
