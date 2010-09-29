# Read about factories at http://github.com/thoughtbot/factory_girl


Factory.sequence :survey_name do |n|
  "MySurvey_#{n}"
end

Factory.define :survey do |f|
  f.name Factory.next :survey_name
  f.user_id 1
  f.after_build {|survey| survey.packets << Factory(:packet_with_two_words, :user_id => survey.user_id)}
end
