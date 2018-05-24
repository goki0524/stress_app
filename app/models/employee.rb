class Employee < ApplicationRecord
  has_many :values, dependent: :destroy
  has_many :relationships, dependent: :destroy
  has_many :departments, through: :relationships
  before_save { email.downcase! }
  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
              format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :age, numericality: { only_integer: true, greater_than: 0 }
  validates :sex, numericality: { only_integer: true, greater_than: 0, less_than: 3 }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # 渡された文字列のハッシュ値を返す
  def Employee.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  # 氏名を返す
  def full_name
    first_name + last_name
  end
  
  # 部署に所属する
  def belong(department)
    # relationships.create(department_id: department.id)
     departments << department
  end
  
  # 部署に所属しているか判定
  def belong?(department)
    # relationships.find_by(department_id: department.id)
    departments.include?(department)
  end
  
  # 部署を抜ける
  def escape(department)
    # relationships.find_by(department_id: department.id).delete
    departments.delete(department)
  end
  
  # ストレス値を提出した実施回の会社に面談メールを送信
  def send_interview_mail(value)
    company = []
    value.projects.each do |project|
      company << project.company
    end
    EmployeeMailer.send_interview_mail(self, company).deliver_now
  end
   
  # ストレスチェックの結果を自身のメールへ送信
  def send_result_mail(value)
    EmployeeMailer.send_result_mail(self, value).deliver_now
  end
  
end
