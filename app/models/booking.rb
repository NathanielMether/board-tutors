class Booking < ApplicationRecord
  belongs_to :profile
  belongs_to :user
  validates :start_at, :end_at, :overlap => { :scope => "profile_id" }

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
end
