require 'spec_helper'

describe "courses/index.html.haml" do
  before(:each) do
    assign(:courses, [
      stub_model(Course,
        :name => "Name",
        :description => "Description",
        :user_id => 1
      ),
      stub_model(Course,
        :name => "Name",
        :description => "Description",
        :user_id => 1
      )
    ])
  end

  it "renders a list of courses" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Description".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
  end
end
