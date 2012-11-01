class SchoolsController < ApplicationController
  def show
    @school = School.find(params[:id])
    @filter = params[:filter]
  end
end
