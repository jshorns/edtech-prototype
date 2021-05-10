require 'student_record'
require 'adaptation_algorithm'

class QuestionPicker
  attr_reader :student_record

  def initialize(question_set, student_record = StudentRecord.new, adaptation_algorithm = DefaultAA.new)
    @question_set = question_set
    @student_record = student_record
    @adaptation_algorithm = adaptation_algorithm
  end

  def fetch_question
    difficulty = @adaptation_algorithm.calculate(@student_record)
    return max_level if difficulty > max_level
    return min_level if difficulty < min_level
    @question_set.select { |question| question.difficulty == difficulty }.sample
  end

  def answer_question(question, answer)
    question.submit_answer(answer)
    @student_record.add_question(question)
  end

  private

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

end
