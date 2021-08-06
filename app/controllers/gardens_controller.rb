class GardensController < ApplicationController
  def show
    @garden = Garden.find(params[:id])
    require "pry";binding.pry
    @garden_plants = @garden.plots.plants.garden_plants_below_100_day_harvest

  end
end
