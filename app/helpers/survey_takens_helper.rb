module SurveyTakensHelper
  def get_question_answer(question)
    icon = if question.is_answer_correct?
      image_tag('tick.png')
    else
      image_tag('cross.png')
    end
    " #{icon}&nbsp;#{question.answer}"
  end
end
