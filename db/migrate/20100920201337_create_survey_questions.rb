class CreateSurveyQuestions < ActiveRecord::Migration
  def self.up
    create_table :survey_questions do |t|
      t.integer :survey_taken_id
      t.integer :order
      t.integer :word_id
      t.string :answer
      t.boolean :is_correct

      t.timestamps
    end

    add_index :survey_questions, :survey_taken_id
  end

  def self.down
    drop_table :survey_questions
  end
end
