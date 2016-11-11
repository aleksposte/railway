class CarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]

  def index
    @carriages = Carriage.all
  end


  def show
  end

  
  def new
    @carriage = Carriage.new
  end

 
  def edit
  end


  def create
    @carriage = Carriage.new(carriage_params)

    respond_to do |format|
      if @carriage.save
        format.html { redirect_to @carriage, notice: 'Carriage was successfully created.' }
        format.json { render :show, status: :created, location: @carriage }
      else
        format.html { render :new }
        format.json { render json: @carriage.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @carriage.update(carriage_params)
        format.html { redirect_to @carriage, notice: 'Carriage was successfully updated.' }
        format.json { render :show, status: :ok, location: @carriage }
      else
        format.html { render :edit }
        format.json { render json: @carriage.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @carriage.destroy
    respond_to do |format|
      format.html { redirect_to carriages_url, notice: 'Carriage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_carriage
      @carriage = Carriage.find(params[:id])
    end

    
    def carriage_params
      params.require(:carriage).permit(:number, :type_carriage, :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, :seats_seats, :train_id)
    end


end
