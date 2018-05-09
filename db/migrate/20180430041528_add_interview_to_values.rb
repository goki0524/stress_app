class AddInterviewToValues < ActiveRecord::Migration[5.1]
  def change
    add_column :values, :interview, :boolean, default: false
  end
end
