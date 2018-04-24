class Project < ApplicationRecord
  belongs_to :company
  default_scope -> { order(created_at: :desc) }
  validates :company_id, presence: true
  validates :project_name, presence: true, length: { maximum: 50 }
  validates :employee_number, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_end_check

  def start_end_check
    errors.add(:end_date, "の日付を正しく記入して下さい。") unless
    self.start_date < self.end_date
  end 
end
