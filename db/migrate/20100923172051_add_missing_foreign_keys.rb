class AddMissingForeignKeys < ActiveRecord::Migration
  def self.up
    add_foreign_key :survey_questions, :survey_takens
    add_foreign_key :survey_takens, :surveys
    add_foreign_key :survey_packets, :surveys
    add_foreign_key :survey_packets, :packets
  end

  def self.down
    remove_foreign_key :survey_questions, :survey_takens
    remove_foreign_key :survey_takens, :surveys
    remove_foreign_key :survey_packets, :surveys
    remove_foreign_key :survey_packets, :packets
  end
end
