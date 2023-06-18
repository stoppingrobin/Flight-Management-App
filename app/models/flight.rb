# frozen_string_literal: true

class Flight < ActiveRecord::Base
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'
  has_many :reservations
end
