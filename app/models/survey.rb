class Survey < ActiveRecord::Base
  has_many :survey_packets
  has_many :packets, :through => :survey_packets
  validate :must_have_packets
  has_many :survey_takens
  validates_presence_of :name
  validates_uniqueness_of :name
  belongs_to :user

  def must_have_packets
    logger.debug "must_have_packets: packets = #{self.packets.size}; packet_ids = #{self.packet_ids.size} "
    errors[:base] << "Moet op zijn minst 1 woordenlijst hebben!" unless self.packets.size > 0 || self.packet_ids.size > 0
  end

  def all_words
    words = []
    packets.each {|p| words = words + p.words}
    words
  end

  def best_result
    unless survey_takens.size == 0
      max = 0.0
      survey_takens.each do |taken_test|
        max = taken_test.score if taken_test.score.present? && taken_test.score > max
      end
      max
    end
  end

  def self.delete(survey_id)
    # use sql queries instead
    ActiveRecord::Base.transaction do
      Survey.connection.execute("delete from survey_questions where survey_taken_id in (select id from survey_takens where survey_id=#{survey_id})")
      Survey.connection.execute("delete from survey_takens where survey_id=#{survey_id}")
      Survey.connection.execute("delete from survey_packets where survey_id=#{survey_id}")
      Survey.connection.execute("delete from surveys where id=#{survey_id}")
    end
  end

  scope :owned_by, lambda { |user| where("user_id = ?", user.id) }
end
