class Company < ApplicationRecord
  before_save { company_email.downcase! }
  validates :company_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :company_email, presence: true, length: { maximum: 255 },
              format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :department_number, numericality: { only_integer: true, greater_than: 0 }
  validates :employee_number, numericality: { only_integer: true, greater_than: 0 }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # 渡された文字列のハッシュ値を返す
  def Company.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end

