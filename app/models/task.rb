class Task < ApplicationRecord
  belongs_to :plant
  belongs_to :user
  has_many :gardens, through: :user

  validates :name, :plant_id, :user_id, presence: :true
end
