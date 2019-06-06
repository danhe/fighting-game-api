class AddWeaponsToFightings < ActiveRecord::Migration[5.2]
  def change
    add_reference :fightings, :fighter_one_weapon, foreign_key: { to_table: :weapons }
    add_reference :fightings, :fighter_two_weapon, foreign_key: { to_table: :weapons }
  end
end
