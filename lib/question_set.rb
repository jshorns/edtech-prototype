class QuestionSet
  attr_reader :questions

  def initialize(*args)
    @questions = args
    @difficulties = @questions.map{ |q| q.difficulty }
  end

  def complete?
    @questions.empty?
  end

  def max_level
    @difficulties.max
  end

  def min_level
    @difficulties.min
  end

  def range
    @difficulties.uniq.count
  end

end