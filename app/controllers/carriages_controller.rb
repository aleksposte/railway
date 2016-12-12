class CarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]
  # before_action :set_train, only: [:new, :create]

  def index
    @carriages = Carriage.all
  end

  def show
    @carriage = Carriage.find(params[:id])
  end

  
  def new
    @carriage = Carriage.new
  end

 
  def edit
  end


  def create
    @carriage = @train.carriages.new(carriage_params)

    if @carriage.save
      redirect_to @train, notice: 'Вагон создан!'
    else
      render :new
    end
  end


  def update
    if @carriage.update(carriage_params)
      redirect_to @carriage, notice: 'Информация о вагоне обновлена!'
    else
      render :edit
    end
  end


  def destroy
    @carriage.destroy
      redirect_to carriages_url, notice: 'Вагон удален!' 
  end

  private
    
    def set_carriage
      @carriage = Carriage.find(params[:id])
    end

    def set_train
      @train = Train.find(params[:train_id])
    end

    
    def carriage_params
      params.require(:carriage).permit(:number, :type_carriage, :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, :seat_seats, :train_id)
    end


end
