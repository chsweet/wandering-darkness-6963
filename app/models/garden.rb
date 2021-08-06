class Garden < ApplicationRecord
  has_many :plots

  def plants_below_100_day_harvest
    plots.joins(:plants)
    .select('plants.name')
    .distinct
    .where("plants.days_to_harvest < ?", 100)
    .group('plants.name')
  end
end
