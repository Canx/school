class SearchController < ApplicationController
  # En index no se procesa query
  def index
    params.delete(:query)
    find_results
  end

  # En show se procesa query, debe ser obligatorio
  def show
    alert_if_is_empty params[:query] and return
    find_results
  end

  private

  def find_results
    @city = City.find(params[:city_id]) if params[:city_id]
    @cities = []
    @cities = City.find_by_filter(params) if params[:city_id].nil? 

    @level = Level.find(params[:level_id]) if params[:level_id]
    @levels = []
    @levels = Level.find_by_filter(params) if params[:level_id].nil?

    @schools = School.find_by_filter params
  end

  def alert_if_is_empty(query)
    if query.blank? then
      flash[:alert] = "Debes introducir una ciudad"
      redirect_to :action => "index"
      return true
    else
      return false
    end
  end
end
