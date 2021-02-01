json.array! @clinics do |clinic|
  json.id clinic.id
  json.name clinic.name
  json.doctor  clinic.doctor
  json.address  clinic.address
  json.phone_number  clinic.phone_number
  json.official_site  clinic.official_site
  json.postcode  clinic.postcode
  json.explanation  clinic.explanation
  json.nearest_station  clinic.nearest_station
  json.latitude  clinic.latitude
  json.longitude  clinic.longitude
end