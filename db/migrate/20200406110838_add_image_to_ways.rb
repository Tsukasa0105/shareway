class AddImageToWays < ActiveRecord::Migration[5.2]
  def change
    add_column :ways, :image, :string
  end
end
