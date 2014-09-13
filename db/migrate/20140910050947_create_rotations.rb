class CreateRotations < ActiveRecord::Migration
  def change
    create_table :rotations do |t|
      t.integer :user_id
      t.string :timeframe
      t.string :description

      t.timestamps
    end
  end
end
