require 'spec_helper'

describe "user_languages/show.html.haml" do
  before(:each) do
    @user_language = assign(:user_language, stub_model(UserLanguage,
      :name => "Name",
      :abbr => "Abbr",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Abbr/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
