class MediaItem < ActiveRecord::Base
  self.inheritance_column = nil
  belongs_to :post
end
