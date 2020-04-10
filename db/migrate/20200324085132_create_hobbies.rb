class CreateHobbies < ActiveRecord::Migration[5.2]
  def change
    create_table :hobbies do |t|
      t.string :name
      t.string :content

      t.timestamps
    end
  end
end
