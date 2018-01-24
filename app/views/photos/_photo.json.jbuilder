json.extract! photo, :id, :image, :country, :city, :year, :month, :created_at, :updated_at
json.url photo_url(photo, format: :json)
