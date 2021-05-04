class QuestionPicker
  attr_reader :student_record

  def initialize(question_set)
    @question_set = question_set
    @student_record = []
  end

  def fetch_question(difficulty)
    @question_set.select { |question| question.difficulty == difficulty }.sample
  end

  def answer_question(question, answer)
    question.submit_answer(answer)
    @student_record << question
  end



end
