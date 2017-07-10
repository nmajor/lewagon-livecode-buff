class CreateAwards < ActiveRecord::Migration[5.0]
  def change
    create_table :awards do |t|
      t.references :merit, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
