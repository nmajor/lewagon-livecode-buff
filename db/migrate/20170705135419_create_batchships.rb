class CreateBatchships < ActiveRecord::Migration[5.0]
  def change
    create_table :batchships do |t|
      t.references :user, foreign_key: true
      t.references :batch, foreign_key: true
      t.string :role

      t.timestamps
    end
    add_index :batchships, :role
  end
end
