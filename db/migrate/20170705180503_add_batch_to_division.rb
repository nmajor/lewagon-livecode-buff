class AddBatchToDivision < ActiveRecord::Migration[5.0]
  def change
    add_reference :divisions, :batch, foreign_key: true
  end
end
