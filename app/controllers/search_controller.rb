class SearchController < ApplicationController
  def index
  end

  def show
      @schools ||= School
      search_by_city(params[:query])
      search_by_level(params[:level])
      paginate(params[:page])
  end

  private

  def search_by_city(city_query)
    if !city_query.blank?
      @schools = @schools.joins(:city).where(["cities.name LIKE ?", "#{city_query}%"])
      if @schools.count == 0
        flash[:error] =  "No se han encontrado centros en #{city_query}"
        redirect_to :action => "index"
      end
      @schools = @schools.order("cities.name ASC, name ASC")
    else
      flash[:error] = "Debes introducir una localidad"
      redirect_to :action => "index"
    end
  end

  def search_by_level(level)
    if !level.blank?
      @schools = @schools.joins(:levels).where(:levels => {:id => level})
    end
  end

  def paginate(next_page)
    @schools = @schools.page next_page
  end
end
