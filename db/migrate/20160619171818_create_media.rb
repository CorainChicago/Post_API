class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.integer :post_id
      t.string :full
      t.integer :height
      t.integer :width
      t.text :type
      t.string :url

      t.timestamps null: false
    end
  end
end
