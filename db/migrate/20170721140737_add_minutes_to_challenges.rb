class AddMinutesToChallenges < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :minutes, :integer
  end
end
