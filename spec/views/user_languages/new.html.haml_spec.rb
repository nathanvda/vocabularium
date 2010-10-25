require 'spec_helper'

describe "user_languages/new.html.haml" do
  before(:each) do
    assign(:user_language, stub_model(UserLanguage,
      :new_record? => true,
      :name => "MyString",
      :abbr => "MyString",
      :user_id => 1
    ))
  end

  it "renders new user_language form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => user_languages_path, :method => "post" do
      assert_select "input#user_language_name", :name => "user_language[name]"
      assert_select "input#user_language_abbr", :name => "user_language[abbr]"
    end
  end
end
