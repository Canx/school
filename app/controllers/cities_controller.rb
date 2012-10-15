class CitiesController < ApplicationController

  def show
    redirect_to city_levels_url(params[:id])
  end
end
