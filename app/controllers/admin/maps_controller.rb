class Admin::MapsController < ApplicationController
  def index
    @maps = Map.all
  end

  def new
    @map = Map.new
  end

  def show
    @map = Map.find(params[:id])
  end

  def create
    @map = Map.new(map_params)
    @map.save
    redirect_to admin_map_path(@map)
  end

  def destroy
    @map = Map.find(params[:id])
    @map.destroy
    redirect_to admin_maps_path
  end

  private

  def map_params
    params.require(:map).permit(:name, :caption, :address, :latitude, :longitude)
  end
end
