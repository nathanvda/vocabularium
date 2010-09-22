class AddUserToPackets < ActiveRecord::Migration
  def self.up
    add_column :packets, :user_id, :integer
    add_index :packets, :user_id
  end

  def self.down
    remove_index :packets, :user_id
    remove_column :packets, :user_id
  end
end
