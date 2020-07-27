class Plant < ApplicationRecord
  belongs_to :garden
  has_many :tasks
  has_many :users, through: :tasks
  has_many :users, through: :garden
end
