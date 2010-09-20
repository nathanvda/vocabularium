# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :survey_taken do |f|
  f.survey_id 1
  f.score 1.5
  f.nr_correct 1
  f.nr_questions 1
  f.current_question 1
end
