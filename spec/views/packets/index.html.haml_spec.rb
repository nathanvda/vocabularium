require 'spec_helper'

describe "packets/index.html.haml" do
  before(:each) do
    assign(:packets, [
      stub_model(Packet,
        :name => "Name",
        :words => [stub_model(Word), stub_model(Word)]
      ),
      stub_model(Packet,
        :name => "Name",
        :words => [stub_model(Word)]
      )
    ])
  end

  it "renders a list of packets" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 2.to_s, :count => 1)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 1)
  end
end
