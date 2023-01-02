class User < ApplicationRecord
  has_many :favorites
  has_many :restaurants, through: :favorites
  has_many :user_tags
  has_many :tags, through: :user_tags
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
