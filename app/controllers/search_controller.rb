class SearchController < ApplicationController
  def index
  end

  def show
    alert_if_is_empty params[:query] and return

    @schools = School.like params[:query]
    @levels = Level.like params[:query]
    @cities = City.like params[:query]
  end

  private

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
