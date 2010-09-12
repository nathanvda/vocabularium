require 'spec_helper'

describe "packets/show.html.haml" do
  before(:each) do
    @packet = assign(:packet, stub_model(Packet,
      :name => "Name",
      :course_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Name".to_s)
    rendered.should contain(1.to_s)
  end
end
