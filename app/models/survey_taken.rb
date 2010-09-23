class SurveyTaken < ActiveRecord::Base
  belongs_to :survey
  has_many :survey_questions

  def self.prepare_test(survey)
    new_test = SurveyTaken.new(:current_question => 0, :nr_correct => 0, :score => 0)
    new_test.add_questions_from(survey)
    new_test.update_attribute(:nr_questions, new_test.survey_questions.size)
    new_test
  end

  def add_questions_from(survey)
    all_words = survey.all_words
    counter = 1
    all_words.randomize.each do |word|
      q = SurveyQuestion.new(:order => counter, :word_id => word.id)
      survey_questions << q
    end
  end
end
