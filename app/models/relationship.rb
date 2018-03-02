class Relationship < ApplicationRecord
   belongs_to :department
   belongs_to :employee
   validates :department_id, presence: true
   validates :employee_id, presence: true
end
