class RestaurantsController < ApplicationController
  def index
  end

  def dashboard
    skip_authorization
  end
end
