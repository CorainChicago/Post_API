class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :handle
      t.integer :crowd_tangle_id
      t.string :name
      t.string :platform
      t.string :profileImage
      t.integer :subscriberCount
      t.string :url
      t.boolean :verified

      t.timestamps null: false
    end
  end
end
