class User < ActiveRecord::Base
  has_many :lists, dependent: :destroy
  
  validates :name, presence: true, length: { maximum: 50 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 250 },
                    format: VALID_EMAIL_REGEX,
                    uniqueness: { case_sensitive: false }
                    
  before_save { self.email = email.downcase }
  
  has_secure_password
end
