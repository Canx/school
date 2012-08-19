class LevelsController < ApplicationController
  def index
    @levels=School.where("city_id" => params[:city_id])
    @levels=@levels.joins(:levels).group("levels.id")
    @levels=@levels.select("levels.id as id,levels.name as name, count(levels.id) as total")
  end

  def show
    # params[:id] -> level.id
    # params[:city] -> ciudad.id
    # escuelas de un nivel y ciudad concretos
    # TODO: controlar que se pasa el nivel y la ciudad
    @city = City.find(params[:city_id])
    @level = Level.find(params[:id])

    @schools = School.where(:city_id => @city.id)
    @schools = @schools.joins(:levels)
    @schools = @schools.where(:levels => {:id => @level.id})
  end
end
