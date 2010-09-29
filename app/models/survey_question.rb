class SurveyQuestion < ActiveRecord::Base
  belongs_to :survey_taken
  belongs_to :word

  def is_correct?
    # naive approach
    is_correct ||= is_answer_correct?
  end

  # calculates if the given answer corresponds to the
  def is_answer_correct?
    answer_arr = convert_to_comparable_parts(answer)
    correct_arr = convert_to_comparable_parts(word.translation)
    answer_arr.sort == correct_arr.sort
  end

  def convert_to_comparable_parts(word)
    logger.debug 'SurveyQuestion: convert_to_comparable_parts received <#{word}>'
    return [] if word.nil?
    arr = word.strip.split(/[\.,;\(\)]/)
    logger.debug 'SurveyQuestion: convert_to_comparable_parts converted to arr= <#{arr.inspect}>'
    arr.map { |w| w.strip.downcase }
  end
end
