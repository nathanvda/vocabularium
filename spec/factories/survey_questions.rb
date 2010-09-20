# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :survey_question do |f|
  f.survey_taken_id 1
  f.order 1
  f.word_id 1
  f.answer "MyString"
  f.is_correct false
end
