class User < ApplicationRecord
    has_many :plants, dependent: :destroy
    has_many :tasks, dependent: :destroy
    has_one :garden, dependent: :destroy
    has_many :plants, through: :tasks
    validates :username, uniqueness: true, presence: true
    validates :password, presence: true
    has_secure_password

end
