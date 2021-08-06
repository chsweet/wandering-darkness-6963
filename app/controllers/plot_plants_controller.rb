class PlotPlantsController < ApplicationController
  def destory
    plot_plant = PlotPlant.find(plot: params[:plot_id], plant: params[:plant_id])

    plot_plant.destory

    redirect_to plots_path
  end
end
