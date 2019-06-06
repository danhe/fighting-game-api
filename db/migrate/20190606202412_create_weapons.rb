class CreateWeapons < ActiveRecord::Migration[5.2]
  def change
    create_table :weapons do |t|
      t.string :name
      t.float :experience_price, default: 0
      t.float :additional_power, default: 0

      t.timestamps
    end
  end
end
