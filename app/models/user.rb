class User < ApplicationRecord
    has_many :plants
    has_many :tasks
    has_one :garden
    has_many :plants, through: :tasks
end
