
class Department < ApplicationRecord
  belongs_to :company
  has_many :relationships
  has_many :employees, through: :relationships
  validates :company_id, presence: true
  validates :department_name, presence: true, length: { maximum: 50 }
  validates :employee_number, numericality: { only_integer: true, 
                  greater_than: 0 }
  
  
  
  # Departmentが新規作成された時にCompanyにEmailを送る
  def send_qrcode_email
    DepartmentMailer.send_qrcode(self).deliver_now
  end
  
  
  
  
end

