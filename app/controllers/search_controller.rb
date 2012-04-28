class SearchController < ApplicationController
  def show
    if !params[:query].nil?
      @schools = School.order("name")
      @schools = search_by_name(params[:query], params[:tipoBusqueda])
      @schools = search_by_city(params[:query], params[:tipoBusqueda])
      @schools = search_by_level(params[:nivel])
    end
  end

  private
  def search_by_city(city, tipoBusqueda)
    if !city.nil? and tipoBusqueda == "Ciudad" then
      @schools.joins(:city).where(:cities => {:name => city})
    else
      @schools
    end
  end

  def search_by_name(name, tipoBusqueda)
    if !name.nil? and tipoBusqueda == "Nombre" then
      @schools.like(params[:query], "name")
    else
      @schools
    end
  end

  def search_by_level(level)
    if !level.nil?
      @schools.joins(:levels).where(:levels => {:id => level})
    else
      @schools
    end
  end
end
