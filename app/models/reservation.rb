# frozen_string_literal: true

class Reservation < ActiveRecord::Base
  belongs_to :flight
  belongs_to :client
  def category_name
    category == 0 ?  "First Class" : "Economy Class"
  end
end
