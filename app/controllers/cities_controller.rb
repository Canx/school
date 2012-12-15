class CitiesController < ApplicationController

  def show
    @city = City.find(params[:id])
    @levels = Level.total_schools_by_city(params[:id])

    # TODO: add previous applied filters
    @filter = { city_id: params[:id] }
    @filtered_levels = Level.find_by_filter(@filter)
  end
end
