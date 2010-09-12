require 'spec_helper'

describe "courses/new.html.haml" do
  before(:each) do
    assign(:course, stub_model(Course,
      :new_record? => true,
      :name => "MyString",
      :description => "MyString",
      :user_id => 1
    ))
  end

  it "renders new course form" do
    render

    rendered.should have_selector("form", :action => courses_path, :method => "post") do |form|
      form.should have_selector("input#course_name", :name => "course[name]")
      form.should have_selector("input#course_description", :name => "course[description]")
      form.should have_selector("input#course_user_id", :name => "course[user_id]")
    end
  end
end
