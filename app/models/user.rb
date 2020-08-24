class User < ApplicationRecord
  has_secure_password

  has_many :notes

  validates :email,
    format: { :with => /[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+/, message: 'Invalid Email' },
    uniqueness: { case_sensitive: false }, length: { maximum: 254 }

  validates_presence_of :first_name, :password
end
