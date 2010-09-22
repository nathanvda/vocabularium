# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.sequence :original do |n|
  "WordToTranslate#{n}"
end

Factory.sequence :translation do |n|
  "Translation#{n}"
end


Factory.define :word do |f|
  f.original Factory.next(:original)
  f.translation Factory.next(:translation)
  f.packet_id 1
end
