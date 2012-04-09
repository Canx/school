class SearchController < ApplicationController
  def show
    @schools = School.like(params[:query])
  end
end
