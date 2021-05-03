
def question_picker(difficulty, questions)
  questions.select { |question| question.difficulty == difficulty }.sample
end
