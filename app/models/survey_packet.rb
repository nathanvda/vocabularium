class SurveyPacket < < ActiveRecord::Base
  belongs_to :survey
  belongs_to :packet
end