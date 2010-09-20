class RenameSurveyPackets < ActiveRecord::Migration
  def self.up
    rename_table :surveys_packets, :survey_packets
  end

  def self.down
    rename_table :survey_packets, :surveys_packets
  end
end
