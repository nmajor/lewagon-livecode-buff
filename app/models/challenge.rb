class Challenge < ApplicationRecord
  belongs_to :division

  def minutes_to_string
    "#{minutes}:00"
  end
end
