class SearchController < ApplicationController
  def index
  end

  def show
    alert_if_is_empty params[:query] and return

    get_schools_from_cities_like params[:query]

    alert_if_no_schools_found and return
    redirect_to_city_if_only_one_found and return

    render_cities
  end

  private

  def alert_if_is_empty(query)
    if query.blank? then
      flash[:alert] = "Debes introducir una localidad"
      redirect_to :action => "index"
      return true
    else
      return false
    end
  end

  def alert_if_no_schools_found
    if @schools.count == 0 then
      flash[:alert] = "No se han encontrado centros en #{params[:query]}"
      redirect_to :action => "index"
      return true
    else
      return false
    end
  end

  def get_schools_from_cities_like(city_query)
    @schools ||= School
    @schools = @schools.joins(:city).where(["cities.name LIKE ?", "#{city_query}%"])
    #@schools = @schools.order("cities.name ASC, schools.name ASC")
  end

  def redirect_to_city_if_only_one_found
    @cities = @schools.group("city_id").count 
    if @cities.count == 1 then
      redirect_to city_path(@schools.first.city)
      return true
    else
      return false
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
