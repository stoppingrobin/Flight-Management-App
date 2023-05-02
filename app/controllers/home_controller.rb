# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @flights = Flight.where('departure > ?', Time.now).paginate(page: params[:page], per_page: 10)
  end
end
