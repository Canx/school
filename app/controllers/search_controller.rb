class SearchController < ApplicationController
  # En index no se procesa query
  def index
    params.delete(:query)
    find_results
    render "show"
  end

  # En show se procesa query, debe ser obligatorio
  def show
    redirect_to "index", alert: "Debes introducir una ciudad" if params[:query].blank?
    find_results

    # FIXME: no se visualiza, test falla
    redirect_to "index", alert: "No se han encontrado centros" if @schools.nil?
  end

  private

  def find_results
    @city = params[:city_id] ? City.find(params[:city_id]) : nil
    @cities = City.find_by_filter(params) if params[:city_id].nil?
    @cities = nil if @cities == City

    # TODO: Si se ha pasado el nivel hay que buscar los subniveles!
    @level = params[:level_id] ? Level.find(params[:level_id]) : nil
    @levels = Level.find_by_filter(params) if params[:level_id].nil?
    @levels = nil if @levels == Level

    @schools = School.find_by_filter params
    @schools = nil if @schools == School
  end
end
