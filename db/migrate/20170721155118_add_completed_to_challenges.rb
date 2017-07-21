class AddCompletedToChallenges < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :completed, :bool, default: false
  end
end
