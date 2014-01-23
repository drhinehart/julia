GOOGLE_MAPS_API_KEY = "AIzaSyAqXawVQBOgayfFQkHQF_H4x5y96yQ_430"
Geocoder.configure(
  # geocoding service (see below for supported options):
  :lookup => :google,
  # to use an API key:
  #:api_key => GOOGLE_MAPS_API_KEY,
  # geocoding service request timeout, in seconds (default 3):
  :timeout => 5
)
HOME=[42.042041, -91.649238]