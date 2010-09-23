require 'spec_helper'

describe "courses/show.html.haml" do
  before(:each) do
    mock_user = mock(User)
    mock_user.should_receive(:email).and_return('bla@bla.com')
    @course = assign(:course, stub_model(Course,
      :name => "Name",
      :description => "Description",
      :user => mock_user
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Name".to_s)
    rendered.should contain("Description".to_s)
  end
end
