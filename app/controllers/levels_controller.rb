class LevelsController < ApplicationController
  def index
    #TODO: check params
    @city = City.find(params[:city_id])
    @levels = Level.total_schools_by_city(params[:city_id])
  end


  def show
    # TODO: check params
    @city = City.find(params[:city_id])
    @level = Level.find(params[:id])
    @sublevels = @level.children
    @schools = School.from_city(params[:city_id]).with_level(params[:id])

    #TODO: refactorize schools_levels
    schools_levels = @schools.collect {|s| s.levels}.flatten.uniq
    @sublevels = @level.children & schools_levels
  end

end
