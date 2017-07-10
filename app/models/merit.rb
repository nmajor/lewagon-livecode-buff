class Merit < ApplicationRecord
  mount_uploader :image, ImageUploader

  def self.random
    offset = rand(self.count)
    self.offset(offset).first
  end
end
