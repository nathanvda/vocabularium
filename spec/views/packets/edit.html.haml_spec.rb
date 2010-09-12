require 'spec_helper'

describe "packets/edit.html.haml" do
  before(:each) do
    @packet = assign(:packet, stub_model(Packet,
      :new_record? => false,
      :name => "MyString",
      :course_id => 1
    ))
  end

  it "renders the edit packet form" do
    render

    rendered.should have_selector("form", :action => packet_path(@packet), :method => "post") do |form|
      form.should have_selector("input#packet_name", :name => "packet[name]")
      form.should have_selector("input#packet_course_id", :name => "packet[course_id]")
    end
  end
end
