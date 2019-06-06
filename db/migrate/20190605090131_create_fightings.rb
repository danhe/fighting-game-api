class CreateFightings < ActiveRecord::Migration[5.2]
  def change
    create_table :fightings do |t|
      t.references :fighter_one, index: true, foreign_key: { to_table: :characters }
      t.references :fighter_two, index: true, foreign_key: { to_table: :characters }
      t.string :winner
      t.float :winner_gained_experience, default: 0.0
      t.boolean :winner_leveled_up, default: false

      t.timestamps
    end
  end
end
