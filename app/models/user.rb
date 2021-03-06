class User < ActiveRecord::Base
  has_many :lists, dependent: :destroy
  has_many :tasks, through: :lists
  
  validates :name, presence: true, length: { maximum: 50 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 250 },
                    format: VALID_EMAIL_REGEX,
                    uniqueness: { case_sensitive: false }
  
  validates :password, length: { minimum: 6 }
                    
  before_save { self.email = email.downcase }
  
  has_secure_password
end
