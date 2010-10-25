class SurveyQuestion < ActiveRecord::Base
  belongs_to :survey_taken
  belongs_to :word

  def is_answer_correct?
    # naive approach
    correctness = read_attribute(:is_correct)
    if correctness.blank?
      correctness = calcalute_answer_correctness
      update_attribute(:is_correct, correctness)
      correctness
    else
      correctness
    end
  end

  # calculates if the given answer corresponds to the
  def calcalute_answer_correctness
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
