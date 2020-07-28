class Garden < ApplicationRecord
  belongs_to :user
  has_many :plants, dependent: :destroy
  accepts_nested_attributes_for :plants
end
