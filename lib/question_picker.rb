class QuestionPicker
  attr_reader :student_record

  def initialize(question_set)
    @question_set = question_set
    @student_record = []
  end

  def decide_difficulty
    return mid_level if !last_question
    if last_question.correctly_answered?
      return max_level if at_max_level
      last_question.difficulty + 1
    else
      return min_level if at_min_level
      last_question.difficulty - 1
    end
  end

  def fetch_question(difficulty = decide_difficulty)
    @question_set.select { |question| question.difficulty == difficulty }.sample
  end

  def answer_question(question, answer)
    question.submit_answer(answer)
    @student_record << question
  end

  private

  def mid_level
    levels = @question_set.map{ |q| q.difficulty }.sort.uniq
    return levels[(levels.length/2) - 1] if levels.length.even?
    return levels[(levels.length - 1) /2] if levels.length.odd?
  end

  def max_level
    @question_set.max_by{ |q| q.difficulty }.difficulty
  end

  def min_level
    @question_set.min_by{ |q| q.difficulty }.difficulty
  end

  def at_max_level
    last_question.difficulty == max_level
  end

  def at_min_level
    last_question.difficulty == min_level
  end

  def last_question
    @student_record.last
  end



end
