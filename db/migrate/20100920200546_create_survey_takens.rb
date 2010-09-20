class CreateSurveyTakens < ActiveRecord::Migration
  def self.up
    create_table :survey_takens do |t|
      t.integer :survey_id
      t.float :score
      t.integer :nr_correct
      t.integer :nr_questions
      t.integer :current_question

      t.timestamps
    end

    add_index :survey_takens, :survey_id
  end

  def self.down
    drop_table :survey_takens
  end
end
