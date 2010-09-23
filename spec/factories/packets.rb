# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.sequence :packet_name do |n|
  "MyPacket_#{n}"
end

Factory.define :packet do |f|
  f.name Factory.next :packet_name
end

Factory.define :packet_with_two_words, :parent => :packet do |f|
  f.after_create do |packet|
    packet.words << Factory(:word, :packet_id => packet.id)
    packet.words << Factory(:word, :packet_id => packet.id)
  end
end

