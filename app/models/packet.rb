class Packet < ActiveRecord::Base
  has_many :words, :dependent => :delete_all
  has_many :survey_packets
  has_many :surveys, :through => :survey_packets

  belongs_to :original_user_language,      :class_name => 'UserLanguage'
  belongs_to :translated_to_user_language, :class_name => 'UserLanguage'

  validates_presence_of   :name
  validates_uniqueness_of :name
  validates_presence_of   :user_id


  #accepts_nested_attributes_for :words, :reject_if => lambda { |a| a.values.all?(&:blank?) }, :allow_destroy => true
  accepts_nested_attributes_for :words, :reject_if => lambda { |a| a[:original].blank? && a[:translation].blank? }, :allow_destroy => true

  scope :owned_by, lambda { |user| where("user_id = ?", user.id) }
end
