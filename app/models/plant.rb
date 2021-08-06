class Plant < ApplicationRecord
  has_many :plot_plants
  has_many :plots, through: :plot_plants

  def self.garden_plants_below_100_day_harvest
    joins(plots: :garden)
    .where("plants.days_to_harvest < ?", 100)
  end
end
