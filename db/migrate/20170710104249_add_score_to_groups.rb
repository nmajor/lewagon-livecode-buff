class AddScoreToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :score, :integer, default: 0
  end
end
