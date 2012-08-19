class CitiesController < ApplicationController

  def show
    @levels=School.where("city_id" => params[:id])
    @levels=@levels.joins(:levels).group("levels.id")
    @levels=@levels.select("levels.id as id,levels.name as name, count(levels.id) as total")
  end
end
