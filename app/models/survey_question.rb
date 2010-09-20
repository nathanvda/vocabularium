class SurveyQuestion < ActiveRecord::Base
  belongs_to :survey_taken
  belongs_to :word
end
