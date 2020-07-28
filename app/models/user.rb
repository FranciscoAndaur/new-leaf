class User < ApplicationRecord
    has_many :plants
    has_many :tasks
    has_one :garden
    has_many :plants, through: :tasks
    has_secure_password
    validates :username, uniqueness: true, presence: true
    validates :password, presence: true

end
