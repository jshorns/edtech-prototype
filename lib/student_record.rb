class StudentRecord
  attr_reader :record

  def initialize
    @record = []
  end

  def add_question(question)
    @record << question
  end

  def last_question_result
  end

  def three_question_average
  end

  def all_time_average
  end

end