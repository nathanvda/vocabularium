require 'spec_helper'

describe "packets/new.html.haml" do
  before(:each) do
    assign(:packet, stub_model(Packet,
      :new_record? => true,
      :name => "MyString",
      :course_id => 1
    ))
  end

  it "renders new packet form" do
    render

    rendered.should have_selector("form", :action => packets_path, :method => "post") do |form|
      form.should have_selector("input#packet_name", :name => "packet[name]")
      form.should have_selector("input#packet_course_id", :name => "packet[course_id]")
    end
  end
end
