class SurveyQuestion < ActiveRecord::Base
  belongs_to :survey_taken
  belongs_to :word

  def is_correct?
    # naive approach
    is_correct ||= (word.translation == answer)
  end
end
