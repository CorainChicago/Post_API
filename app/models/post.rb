class Post < ActiveRecord::Base
  belongs_to :account
  has_many :media_items
  validates :crowd_tangle_id, uniqueness: true
end
