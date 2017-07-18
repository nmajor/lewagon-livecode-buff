class AddCaptainToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :captain_id, :integer
    add_index :groups, :captain_id
  end
end
