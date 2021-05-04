class QuestionPicker

  def initialize(question_set)
    @question_set = question_set
  end

  def fetch_question(difficulty)
    @question_set.select { |question| question.difficulty == difficulty }.sample
  end

end
