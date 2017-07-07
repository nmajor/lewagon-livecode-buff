class ChangeBatchshipUserToStudent < ActiveRecord::Migration[5.0]
  def up
    remove_reference :batchships, :user
    add_reference :batchships, :student
  end

  def down
    remove_reference :batchships, :student
    add_reference :batchships, :user
  end
end
