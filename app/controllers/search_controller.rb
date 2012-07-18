class SearchController < ApplicationController
  def show
    if !params[:query].nil?
      @schools = School
      @schools = search_by_city(params[:query])
      @schools = search_by_level(params[:level])
    end
  end

  private
  def search_by_city(city_query)
    if !city_query.blank?
      @schools = @schools.joins(:city).where(["cities.name LIKE ?", "#{city_query}%"])
      @schools = @schools.order("cities.name ASC, name ASC")
    end
    # TODO: crear error y no continuar
    @schools
  end

  def search_by_level(level)
    if !level.blank?
      @schools = @schools.joins(:levels).where(:levels => {:id => level})
    end
    @schools
  end
end
