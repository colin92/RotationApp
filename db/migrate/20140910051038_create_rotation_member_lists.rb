class CreateRotationMemberLists < ActiveRecord::Migration
  def change
    create_table :rotation_member_lists do |t|
      t.integer :user_id
      t.integer :rotation_id
      t.integer :instance_count

      t.timestamps
    end
  end
end
