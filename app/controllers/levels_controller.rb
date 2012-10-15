class LevelsController < ApplicationController
  def index
    #TODO: check params
    @city = City.find(params[:city_id])
    @levels = Level.total_schools_by_city(params[:city_id])
  end


  def show
    # TODO: check params
    # FIXME: show sublevels and schools from that level
    @city = City.find(params[:city_id])
    @level = Level.find(params[:id])

    @schools = School.where(:city_id => @city.id)
    @schools = @schools.joins(:levels)
    @schools = @schools.where(:levels => {:id => @level.id})
  end
end
