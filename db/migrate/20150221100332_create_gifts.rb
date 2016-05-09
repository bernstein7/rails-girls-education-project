class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.text :descripption
      t.integer :user_id
      t.string :name
      t.integer :price

      t.timestamps
    end
  end
end
