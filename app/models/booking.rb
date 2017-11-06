class Booking < ApplicationRecord
  belongs_to :profile
  belongs_to :user
  validates :start_time, :end_time, 
    :overlap => { :scope => "profile_id" }
end
