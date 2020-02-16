json.extract! location, :id, :long, :lat, :area, :country_id, :created_at, :updated_at
json.url location_url(location, format: :json)
