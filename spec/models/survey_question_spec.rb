require 'spec_helper'

describe SurveyQuestion do
  before (:each) do
    @user = Factory(:user)
    @survey = Factory.build(:survey)
    @survey_taken = SurveyTaken.prepare_test(@survey)
  end

  LIST_OF_EXAMPLES=[["test", "test"],
                    ["houden van, lijden", "lijden, houden van"],
                    ["ezel", " Ezel"],
                    ["vriend", "   vriend   "],
                    ["hard", " HARD"]
                  ]

  LIST_OF_EXAMPLES.each do |pair|
    context "calculate if answer #{pair[1]} is equal to translation #{pair[0]}" do
      before (:each) do
        @word = Factory(:word, :translation => pair[0])
        @question = Factory(:survey_question, :answer => pair[1], :word_id => @word.id, :survey_taken_id => @survey_taken.id)
      end
      it "should check correctly" do
        @question.is_answer_correct?.should == true
      end
    end
  end

  describe '.is_correct?' do
    before (:each) do
      @word = Factory(:word, :translation => "bla")
      @question = Factory(:survey_question, :answer => "bla", :word_id => @word.id, :survey_taken_id => @survey_taken.id)
    end
    it "calculates the correctness if not known" do
      @question.should_receive(:calcalute_answer_correctness).once.and_return(:true)
      @question.is_answer_correct?.should be_true
    end

    it "does not calculate the answer twice" do
      @question.is_correct = true
      @question.should_receive(:calcalute_answer_correctness).never
      @question.is_answer_correct?.should be_true
    end
  end
end
