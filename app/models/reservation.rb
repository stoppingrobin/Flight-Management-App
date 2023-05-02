# frozen_string_literal: true

class Reservation < ActiveRecord::Base
  belongs_to :flight
  belongs_to :client
end
