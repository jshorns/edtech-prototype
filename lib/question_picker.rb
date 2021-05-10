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
    difficulty = max_level if difficulty > max_level
    difficulty = min_level if difficulty < min_level
    @question_set.select { |question| question.difficulty == difficulty }.sample
    # edge cases here where no questions remain of selected difficulty. maybe a while loop so that it keeps looking for questions while the select is coming up with nil? but then does it look for difficulty up or down? select within a given range?
    # so the next iteration would be where question.difficulty.between?(difficulty -1, difficulty + 1)
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
