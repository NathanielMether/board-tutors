class Booking < ApplicationRecord
  belongs_to :profile
  belongs_to :user
  validates :start_at, :end_at, :overlap => { :scope => "profile_id" }
  validates :start_at, :end_at, :overlap => { :scope => "user_id" }
  validate :start_time_is_before_end_time
  validate :date_is_after_today

  def start_time_is_before_end_time
    errors.add(:start_at, 'Start time must be before end time') if (self.start_at > self.end_at)
  end

  def date_is_after_today
    errors.add(:lesson_date, 'Lesson date must be a future or current date') if (self.lesson_date < Date.today)
  end
  
  # Time field on form sets year to 2000 so this will give correct date
  def update_time_date
    start_year = self.start_at.change(:year => self.lesson_date.year)
    start_month = start_year.change(:month => self.lesson_date.month)
    start_day = start_month.change(:day => self.lesson_date.day)
    self.start_at = start_day

    end_year = self.end_at.change(:year => self.lesson_date.year)
    end_month = end_year.change(:month => self.lesson_date.month)
    end_day = end_month.change(:day => self.lesson_date.day)
    self.end_at = end_day
  end

  # Gives total lesson time in hours
  def lesson_length
    seconds = self.end_at - self.start_at
    seconds / 3600.0
  end
end
