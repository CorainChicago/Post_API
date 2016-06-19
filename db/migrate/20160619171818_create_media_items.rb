class CreateMediaItems < ActiveRecord::Migration
  def change
    create_table :media_items do |t|
      t.integer :post_id
      t.text :full
      t.integer :height
      t.integer :width
      t.text :type
      t.string :url

      t.timestamps null: false
    end
  end
end
