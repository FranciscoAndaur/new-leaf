class Task < ApplicationRecord
  belongs_to :plant
  belongs_to :user
  has_many :gardens, through: :user

  validates :name, :plant_id, :user_id, presence: :true

  def complete
    self.update(updated_at: Time.now)
  end

  def interval_days
    case self.interval
    when "daily"
      # change to 1.day
      # change for test to 5 seconds to show the red lines
      5.second
    when "weekly"
      7.day
    when "bi-weekly"
      14.day
    when "monthly"
      1.month
    end
  end

  def time_left
    if weeks < 1
      if days < 1
        if hours < 1
          if minutes < 1
            if seconds < 1
               return "Overdue."
            else
              "#{seconds} second#{"s" if seconds > 1}"
            end
          else
            "#{minutes} minute#{"s" if minutes > 1}"
          end
        else
          "#{hours} hour#{"s" if hours > 1}"
        end
      else
        "#{days} day#{"s" if days > 1}"
      end
    else
      "#{weeks} week#{"s" if weeks > 1}"
    end
  end

  def weeks
    (((self.updated_at + interval_days) - Time.now)/604800).floor
  end

  def days
    (((self.updated_at + interval_days) - Time.now)/86400).floor
  end

  def hours
    (((self.updated_at + interval_days) - Time.now)/3600).floor
  end

  def minutes
    (((self.updated_at + interval_days) - Time.now)/60).floor
  end
  
  def seconds
    (((self.updated_at + interval_days) - Time.now)).floor
  end


end
