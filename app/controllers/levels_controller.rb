class LevelsController < ApplicationController
  def index
    @filtered_levels = Level.find_by_filter(params) 
    @levels = @filtered_levels.nil? ? Level.base : @filtered_levels.base
    @filter = params[:filter]
  end


  def show
    # TODO: check params
    @filtered_levels = Level.find_by_filter(params)
    # TODO: por alguna razón no se guarda :filter, habrá que recrearlo
    @filter = params[:filter]
    @level = Level.find(params[:id])
    @schools = School.find_by_filter({ level_id: params[:id], city_id: params[:city_id]})

    #TODO: move to model school
    schools_levels = @schools.collect {|s| s.levels}.flatten.uniq
    @sublevels = @level.children & schools_levels
  end

end
