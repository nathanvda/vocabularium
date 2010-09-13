class Packet < ActiveRecord::Base
  has_many :words
  accepts_nested_attributes_for :words, :allow_destroy => true
end
