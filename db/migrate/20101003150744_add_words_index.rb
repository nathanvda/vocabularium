class AddWordsIndex < ActiveRecord::Migration
  def self.up
    add_index :survey_questions, :word_id
  end

  def self.down
    remove_index :survey_takens, :word_id
  end
end
