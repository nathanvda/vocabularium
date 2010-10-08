require 'spec_helper'

describe "packets/show.html.haml" do
  before(:each) do
    mock_word = stub_model(Word)
    mock_word.should_receive(:original).twice.and_return('original')
    mock_word.should_receive(:translation).twice.and_return('translation')
    @packet = assign(:packet, stub_model(Packet,
      :name => "Name",
      :words => [mock_word]
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Name".to_s)
    rendered.should contain('original')
    rendered.should contain('translation')
  end
end
