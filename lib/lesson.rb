require 'student_record'
require 'adaptation_algorithm'
require 'question_set'
require 'question'

class Lesson
  attr_reader :student_record, :question_set

  def initialize(question_set, student_record = StudentRecord.new, adaptation_algorithm = DefaultAA.new)
    @question_set = question_set
    @student_record = student_record
    @adaptation_algorithm = adaptation_algorithm
  end

  def fetch_question
    return 'You have answered all the questions!' if @question_set.complete?
    if @student_record.first_question?
      difficulty = @question_set.min_level
    else
      difficulty = @adaptation_algorithm.calculate(@student_record)
      difficulty = @question_set.max_level if difficulty > @question_set.max_level
      difficulty = @question_set.min_level if difficulty < @question_set.min_level
    end
    question = @question_set.questions.select { |question| question.difficulty == difficulty }.sample
    @question_set.questions.delete(question)
    # edge cases here where no questions remain of selected difficulty. maybe a while loop so that it keeps looking for questions while the select is coming up with nil? but then does it look for difficulty up or down? select within a given range?
    # so the next iteration would be where question.difficulty.between?(difficulty -1, difficulty + 1)
  end

  def answer_question(question, answer)
    question.submit_answer(answer)
    @student_record.add_question(question)
  end

end
