class Survey < ActiveRecord::Base
  has_many :survey_packets
  has_many :packets, :through => :survey_packets
end
