class CreateUserLanguages < ActiveRecord::Migration
  def self.up
    create_table :user_languages do |t|
      t.string :name
      t.string :abbr
      t.integer :user_id

      t.timestamps
    end
    add_index :user_languages, :user_id
  end

  def self.down
    drop_table :user_languages
  end
end
