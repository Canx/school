class SearchController < ApplicationController
  def show
    @schools = params[:query].nil? ? nil : search(params[:query], params[:tipoBusqueda])
  end

  private
  def search(query, column)
    School.like(query, column == "Ciudad" ? "city" : "name")
  end
end
