class Task < ApplicationRecord
  belongs_to :plant
  belongs_to :user
  has_many :gardens, through: :user
end
