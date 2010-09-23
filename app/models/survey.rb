class Survey < ActiveRecord::Base
  has_many :survey_packets
  has_many :packets, :through => :survey_packets
  validate :must_have_packets
  validates_presence_of :name
  validates_uniqueness_of :name

  def must_have_packets
    logger.debug "must_have_packets: packets = #{self.packets.size}; packet_ids = #{self.packet_ids.size} "
    errors[:base] << "Moet op zijn minst 1 woordenlijst hebben!" unless self.packets.size > 0 || self.packet_ids.size > 0
  end

  def all_words
    words = []
    packets.each {|p| words = words + p.words}
    words
  end
end
