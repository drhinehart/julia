class Place < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude, :title, :website, :anchor

  has_many :lunch_places
  has_many :lunches, :through=>:lunch_places
  
  #validates_presence_of(:address)

  #default_scope  where("anchor == ?",0)
  scope :anchor, where("anchor > ?",0)
  scope :primary_anchor, where("anchor = ?",1)
  scope :eat, where("anchor is null OR anchor = ?",0)

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  
  def mapable?
    return !latitude.blank? && !longitude.blank? 
  end
  
  def distance_from_home
    dist = 0
    lat = HOME[0]
    lng = HOME[1]
    if self.mapable?
      dist = self.distance_from([lat,lng])
    end
    dist
  end

  def geocode
    if(!address.blank?)
      res = GeoLunch.new(address)
      res.geocode
      self.latitude = res.lat
      self.longitude = res.lng
    end
    [self.latitude,self.longitude]
  end

end
