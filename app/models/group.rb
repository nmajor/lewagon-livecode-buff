class Group < ApplicationRecord
  belongs_to :division
  has_many :groupships, dependent: :destroy
  has_many :students, through: :groupships
end
