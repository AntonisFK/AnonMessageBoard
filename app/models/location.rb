class Location < ActiveRecord::Base

  has_many :posts

  before_create :geocode

  reverse_geocoded_by :latitude, :longitude

  def coords
    [latitude, longitude]
  end

end
