class Project < ApplicationRecord
  belongs_to :company
  has_many :project_values, dependent: :destroy
  has_many :values, through: :project_values
  default_scope -> { order(created_at: :desc) }
  validates :company_id, presence: true
  validates :project_name, presence: true, length: { maximum: 50 }
  validates :employee_number, numericality: { only_integer: true, 
                  greater_than: 0 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_end_check
  
  #実施回期間の論理チェック
  def start_end_check
    errors.add(:end_date, "の日付を正しく記入して下さい。") unless
    self.start_date < self.end_date
  end 
  
  #実施回の期間中のものを返す
  def correct_project
    today = Date.today
    if self.start_date <= today && today <= self.end_date
      return self
    else
      nil
    end
  end
  
end

