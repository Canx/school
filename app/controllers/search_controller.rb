class SearchController < ApplicationController
  # mostrar formulario vacío
  def index
  end

  # mostrar resultados de centros
  def show
    search_by_city_and_level(params[:query],params[:level])
  end

  private

  # FIXME: si hay 1 sola ciudad en los resultados => redirect_to /cities/:id o /cities/:id?level=:level
  def search_by_city_and_level(city_query, level)
    @schools ||= School
    @level = level
    if !city_query.blank? then
      @schools = @schools.joins(:city).where(["cities.name LIKE ?", "#{city_query}%"])
      @schools = @schools.order("cities.name ASC, schools.name ASC")

      if !level.blank?
        @schools = @schools.joins(:levels).where(:levels => {:id => level})
      end

      if @schools.count > 0 then
        render_cities_or_schools
      else
        flash[:error] =  "No se han encontrado centros en #{city_query}"
        redirect_to :action => "index"
      end

    else 
      flash[:error] = "Debes introducir una localidad"
      redirect_to :action => "index"
    end
  end

  def render_cities_or_schools
    @cities = @schools.group("city_id").count 
    if @cities.count > 1 then
      render_cities
    else
      @schools = @schools.page params[:page]
    end
  end

  def render_cities
    @cities = @cities.map do |city_id, count|
      {:id => city_id, :name => City.find(city_id).name, :count => count }
    end
    # FIXME: no funciona correctamente la paginación
    @cities = Kaminari.paginate_array(@cities).page(params[:page])
    render :cities
  end
end
