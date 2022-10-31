json.extract! post, :id, :title, :text, :likes_count, :comments_count, :author_id, :created_at, :updated_at
json.url post_url(post, format: :json)
