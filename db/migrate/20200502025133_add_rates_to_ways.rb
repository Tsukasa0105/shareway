class AddRatesToWays < ActiveRecord::Migration[5.2]
  def change
    add_column :ways, :rate, :float
  end
end
