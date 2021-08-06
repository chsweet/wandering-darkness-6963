require 'rails_helper'

RSpec.describe 'plot index page' do
  before :each do
    @plot_1 = Plot.create!(number: 12, size: "small", direction: "west")
    @plot_2 = Plot.create!(number: 7, size: "medium", direction: "west")
    @plot_3 = Plot.create!(number: 32, size: "small", direction: "east")
    @plot_4 = Plot.create!(number: 1, size: "large", direction: "south")
    @plot_4 = Plot.create!(number: 72, size: "large", direction: "north")

    @plant_1 = Plant.create!(name: 'Cherokee Purple', description: 'lots of sun', days_to_harvest: 90)
    @plant_2 = Plant.create!(name: 'Jalapeno', description: 'hot pepper', days_to_harvest: 75)
    @plant_4 = Plant.create!(name: 'Yukon Gold Potato', description: 'cooler temps and lot of water', days_to_harvest: 110)
    @plant_5 = Plant.create!(name: 'Basil', description: 'prun before it flowers', days_to_harvest: 30)
    @plant_6 = Plant.create!(name: 'Calantro', description: 'flowers quickly', days_to_harvest: 20)

    PlotPlant.create!(plot: @plot_1, plant: @plant_1)
    PlotPlant.create!(plot: @plot_1, plant: @plant_2)
    PlotPlant.create!(plot: @plot_2, plant: @plant_1)
    PlotPlant.create!(plot: @plot_2, plant: @plant_2)
    PlotPlant.create!(plot: @plot_3, plant: @plant_5)
    PlotPlant.create!(plot: @plot_3, plant: @plant_6)
    PlotPlant.create!(plot: @plot_4, plant: @plant_1)
    PlotPlant.create!(plot: @plot_4, plant: @plant_2)
    PlotPlant.create!(plot: @plot_4, plant: @plant_3)

    visit "/plots"
  end

  it ' displays a list of all plot numbers' do
    expect(page).to have_content(@plot_1.number)
    expect(page).to have_content(@plot_2.number)
    expect(page).to have_content(@plot_3.number)
    expect(page).to have_content(@plot_4.number)
    expect(page).to_not have_content(@plot_5.number)
  end

  it 'displays all the plants for each plot' do
    within("#plot-#{plot_2.id}") do
      expect(page).to have_content(@plant_1.name)
      expect(page).to have_content(@plant_2.name)
    end

    within("#plot-#{plot_4.id}") do
      expect(page).to have_content(@plant_1.name)
      expect(page).to have_content(@plant_2.name)
      expect(page).to have_content(@plant_3.name)
    end
  end
end
