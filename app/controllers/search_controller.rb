class SearchController < ApplicationController
  def index
  end

  def show
    if !params[:query].blank?
      @schools = School
      @schools = search_by_city(params[:query])
      @schools = search_by_level(params[:level])
    else
      flash[:notice] = "Debes introducir una localidad"
    end
  end

  private

  def search_by_city(city_query)
    @schools = @schools.joins(:city).where(["cities.name LIKE ?", "#{city_query}%"])
    @schools = @schools.order("cities.name ASC, name ASC")
  end

  def search_by_level(level)
    if !level.blank?
      @schools = @schools.joins(:levels).where(:levels => {:id => level})
    end
    @schools
  end
end
