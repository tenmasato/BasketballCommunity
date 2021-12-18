class CreateCounts < ActiveRecord::Migration[5.2]
  def change
    create_table :counts do |t|
      t.integer :user_id
      t.integer :map_id

      t.timestamps
    end
  end
end
