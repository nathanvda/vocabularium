class UserLanguage < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name
  validates_presence_of :abbr
  validates_presence_of :user_id

  validates_uniqueness_of :name, :scope => :user_id
  validates_uniqueness_of :abbr, :scope => :user_id

  scope :owned_by, lambda { |user| where("user_id = ?", user.id) }
end
