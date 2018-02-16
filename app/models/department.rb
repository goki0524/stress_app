class Department < ApplicationRecord
  belongs_to :company
  validates :company_id, presence: true
  validates :department_name, presence: true, length: { maximum: 50 }
  validates :employee_number, numericality: { only_integer: true, greater_than: 0 }
end
