class LevelsController < ApplicationController
  def index
    @filtered_levels = Level.find_by_filter(params[:filter])
    @levels = @filtered_levels.base
    @filter = params[:filter]
  end


  def show
    # TODO: check params
    @level = Level.find(params[:id])
    @sublevels = @level.children
    @schools = School.from_city(params[:city_id]).with_level(params[:id])
    @filter = params[:filter]

    #TODO: refactorize schools_levels
    # School.levels(:schools => @schools)
    # School.levels.find_
    
    schools_levels = @schools.collect {|s| s.levels}.flatten.uniq
    @sublevels = @level.children & schools_levels
  end

end
