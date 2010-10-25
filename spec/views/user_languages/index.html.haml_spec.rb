require 'spec_helper'

describe "user_languages/index.html.haml" do
  before(:each) do
    assign(:user_languages, [
      stub_model(UserLanguage,
        :name => "Name",
        :abbr => "Abbr",
        :user_id => 1
      ),
      stub_model(UserLanguage,
        :name => "Name",
        :abbr => "Abbr",
        :user_id => 1
      )
    ])
  end

  it "renders a list of user_languages" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Abbr".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
