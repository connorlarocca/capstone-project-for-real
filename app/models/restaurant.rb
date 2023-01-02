class Restaurant < ApplicationRecord
  has_many :favorites
  has_many :users, through: :favorites
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
