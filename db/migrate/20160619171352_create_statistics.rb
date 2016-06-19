class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.integer :actual_likeCount
      t.integer :actual_shareCount
      t.integer :actual_commentCount
      t.integer :expected_likeCount
      t.integer :expected_shareCount
      t.integer :expected_commentCount

      t.timestamps null: false
    end
  end
end
