class AddLanguagesToPacket < ActiveRecord::Migration
  def self.up
    add_column :packets, :original_user_language_id, :integer
    add_column :packets, :translated_to_user_language_id, :integer
    add_index :packets, :original_user_language_id
    add_index :packets, :translated_to_user_language_id
  end

  def self.down
    remove_index :packets, :original_user_language_id
    remove_index :packets, :translated_to_user_language_id
    remove_column :packets, :original_user_language_id
    remove_column :packets, :translated_to_user_language_id
  end
end
