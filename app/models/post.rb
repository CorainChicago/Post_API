class Post < ActiveRecord::Base
  belongs_to :account
  has_many :media_items
end
