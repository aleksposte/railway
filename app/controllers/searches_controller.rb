class SearchesController < ApplicationController
  def show
    @search ||= Search.new
  end

  def create
    @search = Search.new(search_params)
    @search.run
    render :show
  end

  protected

  def search_params
    params.require(:search).permit(:start_station_id, :end_station_id)
  end
end