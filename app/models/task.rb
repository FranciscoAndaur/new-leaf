class Task < ApplicationRecord
  belongs_to :plant
  belongs_to :user
end
