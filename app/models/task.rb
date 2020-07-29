class Task < ApplicationRecord
  belongs_to :plant
  belongs_to :user
  has_many :gardens, through: :user

  validates :content, :plant_id, :user_id, :start_date, presence: :true

  def plant=(input)
    # find the plant that called the creation of this task
    # assign this task the plantid
  end
end
