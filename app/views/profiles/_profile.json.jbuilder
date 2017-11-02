json.extract! profile, :id, :user_id, :profile_image_data, :board_sport, :price, :locations, :bio, :description, :created_at, :updated_at
json.url profile_url(profile, format: :json)
