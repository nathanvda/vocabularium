# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :word do |f|
  f.original "MyString"
  f.translation "MyString"
  f.packet_id 1
end
