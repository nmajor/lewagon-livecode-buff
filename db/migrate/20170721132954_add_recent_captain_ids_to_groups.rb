class AddRecentCaptainIdsToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :recent_captain_ids, :text
  end
end
