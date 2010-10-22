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

  example "a new survey must have packets" do
    s = Survey.new(:name => 'test_survey_xxx')
    s.save
    s.valid?.should be_false
    s.errors[:base].should == ["Moet op zijn minst 1 woordenlijst hebben!"]
  end

  example "all_words returns all words" do
    @survey.all_words == ['word1', 'word2']
  end

  describe ".best_result" do
    it "returns nil if no tests taken" do
      @survey.best_result.should be_nil
    end

    it "returns the result if one test taken" do
      survey_taken = mock(SurveyTaken)
      survey_taken.stub(:score).and_return(66.0)
      @survey.stub(:survey_takens).and_return([survey_taken])
      @survey.best_result.should == 66.0
    end

    it "returns the best result if more than 1 test taken" do
      survey_taken1 = mock(SurveyTaken)
      survey_taken1.stub(:score).and_return(66.0)
      survey_taken2 = mock(SurveyTaken)
      survey_taken2.stub(:score).and_return(67.0)
      survey_taken3 = mock(SurveyTaken)
      survey_taken3.stub(:score).and_return(64.0)
      @survey.stub(:survey_takens).and_return([survey_taken1, survey_taken2, survey_taken3])
      @survey.best_result.should == 67.0

    end
  end

end
