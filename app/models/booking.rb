class Booking < ApplicationRecord
  belongs_to :profile
  belongs_to :user
  validates :start_time, :end_time, :overlap => {:message_title => [:start_at, :end_at], :message_content => "Time slot not available"}
end
