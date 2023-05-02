# frozen_string_literal: true

class Airport < ActiveRecord::Base
  has_many :flights
end
