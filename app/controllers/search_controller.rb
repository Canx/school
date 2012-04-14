class SearchController < ApplicationController
  def show
    @schools = School.order("name")
    unless params[:query].nil? 
      @schools = @schools.like(params[:query], tipo(params[:tipoBusqueda]))
    end
    unless params[:nivel].nil?
      @schools = @schools.joins(:levels).where(["level_id = ?", [params[:nivel]]])
    end
  end

  private
  def tipo(tipoBusqueda)
    tipoBusqueda == "Ciudad" ? "city" : "name"
  end
end
