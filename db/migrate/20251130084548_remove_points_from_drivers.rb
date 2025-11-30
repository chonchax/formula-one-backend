class RemovePointsFromDrivers < ActiveRecord::Migration[8.1]
  def change
    remove_column :drivers, :points, :integer
  end
end
