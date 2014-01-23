class GeoLunch

  attr_accessor :address, :lat, :lng

  def initialize(address)
    @address = address
  end

  def geocode
    #debugger
    response = HTTParty.get("http://maps.googleapis.com/maps/api/geocode/json", query: { address: address, sensor: false })
    response_hash = JSON.parse(response.body)
    unless response_hash['results'].size < 1
      @lat = response_hash['results'].first['geometry']['location']['lat']
      @lng = response_hash['results'].first['geometry']['location']['lng']
    end
    [@lat,@lng]
  end

  def self.golden_point
    places = Place.primary_anchor
    Geocoder::Calculations.geographic_center(places)
  end

end