json.extract! location, :id, :title, :url, :created_at, :updated_at
json.url location_url(location, format: :json)
