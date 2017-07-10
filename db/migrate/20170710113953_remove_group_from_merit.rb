class RemoveGroupFromMerit < ActiveRecord::Migration[5.0]
  def change
    remove_reference :merits, :group
  end

  def down
    add_reference :merits, :group
  end
end
