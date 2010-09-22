# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :user do |f|
  f.email "login@bla.com"
  f.password "blax123"
  f.password_confirmation "blax123"
end
