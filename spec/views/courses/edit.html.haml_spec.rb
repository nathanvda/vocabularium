require 'spec_helper'

describe "courses/edit.html.haml" do
  before(:each) do
    @course = assign(:course, stub_model(Course,
      :new_record? => false,
      :name => "MyString",
      :description => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit course form" do
    render

    rendered.should have_selector("form", :action => course_path(@course), :method => "post") do |form|
      form.should have_selector("input#course_name", :name => "course[name]")
      form.should have_selector("input#course_description", :name => "course[description]")
      form.should have_selector("input#course_user_id", :name => "course[user_id]")
    end
  end
end
