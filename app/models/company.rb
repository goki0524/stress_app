class Company < ApplicationRecord
  attr_accessor :activation_token
  has_many :departments, dependent: :destroy
  has_many :projects, dependent: :destroy
  before_save   :downcase_company_email
  before_create :create_activation_digest
  validates :company_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :company_email, presence: true, length: { maximum: 255 },
              format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :all_employee_number, numericality: { only_integer: true, greater_than: 0 }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # 渡された文字列のハッシュ値を返す
  def Company.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  # ランダムなトークンを返す
  def Company.new_token
    SecureRandom.urlsafe_base64
  end
  
   # トークンがダイジェストと一致したらtrueを返す
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
  
  
  # アカウントを有効にする
  def activate
    update_columns(activated: true, activated_at: Time.zone.now)
  end

  # 有効化用のメールを送信する
  def send_activation_email
    CompanyMailer.account_activation(self).deliver_now
  end


  private
  
    # メールアドレスをすべて小文字にする
    def downcase_company_email
      self.company_email = company_email.downcase
    end

    # 有効化トークンとダイジェストを作成および代入する
    def create_activation_digest
      self.activation_token  = Company.new_token
      self.activation_digest = Company.digest(activation_token)
    end
    
end

