class Word < ActiveRecord::Base
  validates_presence_of :original
  validates_presence_of :translation
end
