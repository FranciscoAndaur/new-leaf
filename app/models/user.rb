class User < ApplicationRecord
    has_many :plants, dependent: :destroy
    has_many :tasks, dependent: :destroy
    has_one :garden, dependent: :destroy
    has_many :plants, through: :tasks
    has_secure_password
end
