class Packet < ActiveRecord::Base
  has_many :words
  has_many :survey_packets
  has_many :surveys, :through => :survey_packets
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :user_id

  #accepts_nested_attributes_for :words, :reject_if => lambda { |a| a.values.all?(&:blank?) }, :allow_destroy => true
  accepts_nested_attributes_for :words, :reject_if => lambda { |a| a[:original].blank? && a[:translation].blank? }, :allow_destroy => true

  scope :owned_by, lambda { |user| where("user_id = ?", user.id) }
end
