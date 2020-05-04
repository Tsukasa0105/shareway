class CreateEnjoyedWays < ActiveRecord::Migration[5.2]
  def change
    create_table :enjoyed_ways do |t|
      t.references :user, foreign_key: true
      t.references :way, foreign_key: true

      t.timestamps
    end
  end
end
