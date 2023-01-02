class User < ApplicationRecord
  has_many :favorites
  has_many :restaurants, through: :favorites

  has_secure_password
  validates :email, presence: true, uniqueness: true
end
