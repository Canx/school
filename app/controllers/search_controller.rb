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
    @city = params[:city_id] ? City.find(params[:city_id]) : nil
    @cities = City.find_by_filter(params) if params[:city_id].nil?
    @cities = nil if @cities == City

    @level = params[:level_id] ? Level.find(params[:level_id]) : nil
    @levels = Level.find_by_filter(params) if params[:level_id].nil?
    @levels = nil if @levels == Level

    @schools = School.find_by_filter params
    @schools = nil if @schools == School
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
