class RestaurantsController < ApplicationController
  respond_to :json
  def index
    respond_with {}
  end
end
