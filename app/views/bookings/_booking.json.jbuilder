json.extract! booking, :id, :lesson_date, :start_time, :end_time, :profile_id, :user_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
