class Groupship < ApplicationRecord
  belongs_to :group
  belongs_to :student
end
