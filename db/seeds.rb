# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'

CSV.foreach(Rails.root.join('lib/airports.csv'), headers: true) do |airport|
  airport_obj = {
    iata: airport['code'],
    name: airport['name']
  }
  Airport.create airport_obj
end

CSV.foreach(Rails.root.join('lib/flights.csv'), headers: true) do |flight|
  departure_airport = Airport.find_by iata: flight['departure_airport']
  arrival_airport = Airport.find_by iata: flight['arrival_airport']
  flight_obj = {
    flight_company_id: flight['number'].to_i,
    departure: flight['departure_date'].to_datetime,
    duration: flight['duration'],
    departure_airport: departure_airport,
    arrival_airport: arrival_airport,
    business_seats: flight['business_class_seats'],
    economy_seats: flight['economy_class_seats']
  }
  Flight.create flight_obj
end