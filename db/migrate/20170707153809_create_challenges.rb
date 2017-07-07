class CreateChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :challenges do |t|
      t.string :desc
      t.references :division, foreign_key: true

      t.timestamps
    end
  end
end
