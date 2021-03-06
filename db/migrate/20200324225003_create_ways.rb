class CreateWays < ActiveRecord::Migration[5.2]
  def change
    create_table :ways do |t|
      t.string :name
      t.string :content
      t.references :user, foreign_key: true
      t.references :hobby, foreign_key: true

      t.timestamps
    end
  end
end
