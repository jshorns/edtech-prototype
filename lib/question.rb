class Question

  attr_reader :question_text, :answer_options, :difficulty, :correct_answer

  def initialize(question_text:, answer_a:, answer_b:, answer_c:, answer_d:, difficulty:, correct_answer:)
    @question_text = question_text
    @answer_options = {
      a: answer_a,
      b: answer_b,
      c: answer_c,
      d: answer_d
    }
    @difficulty = difficulty
    @correct_answer = correct_answer
  end
end