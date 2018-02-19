class Employee < ApplicationRecord
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
  
  

end
