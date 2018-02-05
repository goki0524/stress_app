class Company < ApplicationRecord
  before_save { company_email.downcase! }
  validates :company_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :company_email, presence: true, length: { maximum: 255 },
              format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :department_number, presence: true
  validates :employee_number, presence: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
