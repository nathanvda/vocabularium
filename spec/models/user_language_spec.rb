require 'spec_helper'

describe UserLanguage do
  before (:each) do
    @user_language = Factory(:user_language)
  end

  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:abbr)}
  it {should validate_presence_of(:user_id)}
  it {should validate_uniqueness_of(:name)}
  it {should validate_uniqueness_of(:abbr)}
  it {should belong_to(:user)}
end
