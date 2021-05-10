class StudentRecord
  attr_reader :record

  def initialize
    @record = []
  end

  def add_question(question)
    @record << question
  end

  def last_question_result
    calculate_average(@record.last(1))
  end

  def three_question_average
    calculate_average(@record.last(3))
  end

  def all_time_average
    calculate_average(@record)
  end

  private

  def calculate_average(selection)
    correct = selection.select { |q| q.correctly_answered? }.size.to_f
    (correct/selection.length * 100).round(2)
  end

end