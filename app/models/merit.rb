class Merit < ApplicationRecord
  mount_uploader :image, ImageUploader
  before_save :set_points, :if => Proc.new { |model| !model.points }

  def self.random
    offset = rand(self.count)
    self.offset(offset).first
  end

  private
  def set_points
    self.points = rand(1...100)
  end
end
