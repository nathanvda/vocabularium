class SurveyTaken < ActiveRecord::Base
  belongs_to :survey
  has_many :survey_questions
end
