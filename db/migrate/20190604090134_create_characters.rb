class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :current_life, default: 100
      t.integer :max_life, default: 100
      t.integer :power, default: 2
      t.integer :level, default: 1
      t.integer :current_experience, default: 0
      t.integer :max_experience, default: 100

      t.timestamps null: false
    end
  end
end
