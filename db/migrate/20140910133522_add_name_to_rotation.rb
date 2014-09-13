class AddNameToRotation < ActiveRecord::Migration
  def change
    add_column :rotations, :name, :string
  end
end
