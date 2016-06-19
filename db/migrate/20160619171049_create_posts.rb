class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :account_id
      t.text :caption
      t.datetime :date
      t.text :expandedLinks
      t.integer :crowd_tangle_id, limit: 8
      t.string :link
      t.text :media
      t.text :message
      t.string :platform
      t.string :postUrl
      t.decimal :score, :precision => 25, :scale => 20
      t.integer :statistics_id
      t.integer :subscriberCount
      t.text :type

      t.timestamps null: false
    end
  end
end
