class Art < ActiveRecord::Base

  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos 

  reverse_geocoded_by :latitude, :longitude

  validates :title, :description, presence: true


  def photo
    photos.first
  end

end
