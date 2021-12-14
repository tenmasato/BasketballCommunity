class CreateMapComments < ActiveRecord::Migration[5.2]
  def change
    create_table :map_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :map_id

      t.timestamps
    end
  end
end
