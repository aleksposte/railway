class Admin::RailwayStationsController < Admin::BaseController
  # перенес в BaseController
  # before_action :authenticate_user! 
  before_action :set_railway_station, only: [:show, :edit, :update, :destroy, :update_position]

  def index
    @railway_stations = RailwayStation.all
  end

  def show
  end

  def new
    @railway_station = RailwayStation.new
  end

  def edit
  end

  def create
    @railway_station = RailwayStation.new(railway_station_params)

    respond_to do |format|
      if @railway_station.save
        format.html { redirect_to @railway_station, notice: 'Станция создана!' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @railway_station.update(railway_station_params)
        format.html { redirect_to @railway_station, notice: 'Информация о станции обновлена!' }
      else
        format.html { render :edit }
      end
    end
  end

  # Изменение позиции станции в маршруте, времени прибытия и отправления:  
  def update_position
    @route = Route.find(params[:route_id])
    @railway_station.update_position(@route, params[:position], params[:arrival_time], params[:departure_time])
    redirect_to @route
  end



  def destroy
    @railway_station.destroy
    respond_to do |format|
      format.html { redirect_to railway_stations_url, notice: 'Станция удалена!' }
    end
  end

  private
    def set_railway_station
      @railway_station = RailwayStation.find(params[:id])
    end

    def railway_station_params
      params.require(:railway_station).permit(:title, :route_id)
    end
end

