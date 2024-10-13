class User < ApplicationRecord
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    validates :email, presence: true, uniqueness: true
    validates :first_name, :last_name, presence: true
    has_many :posts
    has_many :comments
end
