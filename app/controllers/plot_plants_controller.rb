class PlotPlantsController < ApplicationController
  def destory
    plot = Plot.find(params[:plot_id])
    plant = Plant.find(params[:plant_id])

    plot_plant = PlotPlant.where(plot_id: plot.id, plant_id: plant.id).first

    PlotPlant.destroy(plot_plant.id)

    redirect_to plots_path
  end
end
