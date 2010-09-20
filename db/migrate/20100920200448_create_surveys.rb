class CreateSurveys < ActiveRecord::Migration
  def self.up
    create_table :surveys do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end

    add_index :surveys, :user_id

    create_table :surveys_packets, :id => false do |t|
      t.references :survey, :packet
    end

    add_index :surveys_packets, [:survey_id, :packet_id]

  end

  def self.down
    drop_table :surveys
  end
end
