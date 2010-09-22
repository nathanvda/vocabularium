# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :survey do |f|
  f.name "MyString"
  f.user_id 1
  f.after_build {|survey| survey.packets << Factory(:packet_with_two_words)}
end
