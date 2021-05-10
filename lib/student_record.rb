class StudentRecord
  attr_reader :record

  def initialize
    @record = []
  end

  def add_question(question)
    @record << question
  end

  def last_question_result
    if @record.last.correctly_answered?
      100
    else
      0
    end
  end

  def three_question_average
    correct = @record.last(3).select { |q| q.correctly_answered? }.size.to_f
    (correct/3 * 100).round(2)
  end

  def all_time_average
    correct = @record.select { |q| q.correctly_answered? }.size.to_f
    (correct/@record.length * 100).round(2)
  end

end