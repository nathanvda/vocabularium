require 'spec_helper'

describe Survey do
  before (:each) do
    @survey = Factory(:survey)
  end

  it {should validate_presence_of(:name)}
  it {should validate_uniqueness_of(:name)}
  it {should have_many(:packets)}
  it {should have_many(:survey_packets)}
  it {should belong_to(:user)}

end
