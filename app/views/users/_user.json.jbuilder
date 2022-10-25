json.extract! user, :id, :name, :photo, :bio, :post_counter, :created_at, :updated_at
json.url user_url(user, format: :json)
