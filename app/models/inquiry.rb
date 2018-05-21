class Inquiry
  include ActiveModel::Model
 
  attr_accessor :name, :email, :message
 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :name, presence: { message: '名前を入力してください'}
  validates :email, presence: { message: 'メールアドレスを入力してください'},
        length: { maximum: 255, message: 'メールアドレスが長すぎます' }, 
        format: { with: VALID_EMAIL_REGEX, message: 'メールアドレスが正しくありません'}
  validates :message, :presence => {:message => 'お問い合わせ内容を入力してください'}, length: { maximum: 255 }
end