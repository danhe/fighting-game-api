class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.float :current_life, default: 100.0
      t.float :max_life, default: 100.0
      t.float :power, default: 2.0
      t.integer :level, default: 1
      t.float :current_experience, default: 0.0
      t.float :max_experience, default: 100.0

      t.timestamps null: false
    end
  end
end
