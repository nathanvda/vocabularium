require 'spec_helper'

describe "courses/show.html.haml" do
  before(:each) do
    @course = assign(:course, stub_model(Course,
      :name => "Name",
      :description => "Description",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Name".to_s)
    rendered.should contain("Description".to_s)
    rendered.should contain(1.to_s)
  end
end
