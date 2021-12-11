class CreateMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :maps do |t|
      t.string :name
      t.text :caption
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :user_id

      t.timestamps
    end
  end
end
