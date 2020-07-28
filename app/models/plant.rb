class Plant < ApplicationRecord
  belongs_to :garden
  has_many :tasks
  has_many :users, through: :tasks
  has_many :users, through: :garden

  validates :plant_type, :size, :water_amount, presence: true
  

  # t.string "plant_type"
  # t.string "nickname"
  # t.integer "size"
  # t.integer "water_ammount"

  


end
