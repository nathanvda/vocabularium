module SurveysHelper
  def show_score(score)
    score.nil? ? I18n.t('survey.not_taken_yet') : '%.2f' % score
  end
end