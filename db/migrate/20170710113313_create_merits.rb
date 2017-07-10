class CreateMerits < ActiveRecord::Migration[5.0]
  def change
    create_table :merits do |t|
      t.references :group, foreign_key: true
      t.string :name
      t.integer :points
      t.string :image

      t.timestamps
    end
  end
end
