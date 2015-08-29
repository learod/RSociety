class ArtSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :latitude, :longitude, :address
end
