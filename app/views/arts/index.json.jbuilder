json.array!(@arts) do |art|
  json.extract! art, :id, :title, :description, :latitude, :longitude, :address
  json.url art_url(art, format: :json)
end
