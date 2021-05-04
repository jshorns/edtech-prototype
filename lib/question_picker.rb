class QuestionPicker
  attr_reader :student_record

  def initialize(question_set)
    @question_set = question_set
    @student_record = []
  end

  def decide_difficulty
    return 2 unless !@student_record.empty?
    return 3 if @student_record.last.correctly_answered? && @student_record.last.difficulty == 3
    return 1 if !@student_record.last.correctly_answered? && @student_record.last.difficulty == 1
    if @student_record.last.correctly_answered?
      @student_record.last.difficulty + 1
    else
      @student_record.last.difficulty - 1
    end
  end

  def fetch_question(difficulty)
    @question_set.select { |question| question.difficulty == difficulty }.sample
  end

  def answer_question(question, answer)
    question.submit_answer(answer)
    @student_record << question
  end



end
