class SearchController < ApplicationController
  # mostrar formulario vacío
  def index
  end

  # mostrar resultados de centros
  def show
    @schools ||= School
    @city_query = params[:query]
    search_by_city
    filter_by_level(params[:level])
    paginate(params[:page])
  end

  private

  def search_by_city
    if !@city_query.blank? then
      @schools = @schools.joins(:city).where(["cities.name LIKE ?", "#{@city_query}%"])

      if @schools.count == 0 then
        flash[:error] =  "No se han encontrado centros en #{@city_query}"
        redirect_to :action => "index"
      else 
        @cities = @schools.group("cities.name").count
        if @cities.count > 1 then 
          render :cities
        else
          @schools = @schools.order("cities.name ASC, schools.name ASC")
        end
      end
    else 
      flash[:error] = "Debes introducir una localidad"
      redirect_to :action => "index"
    end
  end

  def filter_by_level(level)
    if !level.blank?
      @schools = @schools.joins(:levels).where(:levels => {:id => level})
    end
  end

  def paginate(next_page)
    @schools = @schools.page next_page
  end
end
