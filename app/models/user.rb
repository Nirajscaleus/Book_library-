class User < ApplicationRecord
  has_secure_password 
  has_many :books
  validates :username,presence: true, uniqueness: true
  validates :email, presence:true, uniqueness:true
  validates :password, presence:true
  enum role: { owner: 0 , customer: 1 }
  def owner?
    role=="owner"
  end
  def customer?
    role=="customer"
  end
end
