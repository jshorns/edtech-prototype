require 'lesson'

question1 = Question.new(question_text: "Is pudding a cat or a dog?", 
                              answer_a: "cat", 
                              answer_b: "dog", 
                              answer_c: "monkey", 
                              answer_d: "fish", 
                            difficulty: 1, 
                        correct_answer: :a
                        )

question2 = Question.new(question_text: "Is Uncle Matthew a cat or a monkey?", 
                              answer_a: "monkey", 
                              answer_b: "chicken", 
                              answer_c: "dinosaur", 
                              answer_d: "cat", 
                            difficulty: 2, 
                        correct_answer: :d
                        )

question3 = Question.new(question_text: "What kind of animal is Sachin?", 
                              answer_a: "gibbon", 
                              answer_b: "tapir", 
                              answer_c: "snail", 
                              answer_d: "cat", 
                            difficulty: 2, 
                        correct_answer: :d)

question4 = Question.new(question_text: "What kind of animal is Scheana?", 
                              answer_a: "unicorn", 
                              answer_b: "grasshopper", 
                              answer_c: "cat", 
                              answer_d: "ostrich", 
                            difficulty: 1, 
                        correct_answer: :c)

question5 = Question.new(question_text: "Who is Bubbles?", 
                              answer_a: "a spy", 
                              answer_b: "a kitten", 
                              answer_c: "a creature of the deep", 
                              answer_d: "a charlatan", 
                            difficulty: 3, 
                         correct_answer: :b)

question6 = Question.new(question_text: "Who is Stevie?", 
                              answer_a: "a criminal", 
                              answer_b: "a cat", 
                              answer_c: "a rogue", 
                              answer_d: "a highwayman", 
                            difficulty: 3, 
                         correct_answer: :b)

question_set = QuestionSet.new(question1, question2, question3, question4, question5, question6)

lesson = Lesson.new(question_set)

describe 'a lesson with the default algorithm' do
  it 'escalates difficulty up and down according to correct or incorrect answers' do
    question = lesson.fetch_question
    expect(question.difficulty).to eq(1)
    expect(lesson.question_set.questions).not_to include question
    lesson.answer_question(question, question.correct_answer)
    expect(question.correctly_answered?).to be true
    expect(lesson.student_record.record).to include question
    question2 = lesson.fetch_question
    expect(question2.difficulty).to eq(2)
    expect(lesson.question_set.questions).not_to include question2
    lesson.answer_question(question2, "not the right answer")
    expect(question2.correctly_answered?).to be false
    expect(lesson.student_record.record).to include question2
    question3 = lesson.fetch_question
    expect(question3.difficulty).to eq(1)
    expect(lesson.question_set.questions).not_to include question3
    lesson.answer_question(question3, question3.correct_answer)
    expect(question3.correctly_answered?).to be true
    expect(lesson.student_record.record).to include question3
    question4 = lesson.fetch_question
    expect(question4.difficulty).to eq(2)
    expect(lesson.question_set.questions).not_to include question4
    lesson.answer_question(question4, question4.correct_answer)
    expect(question4.correctly_answered?).to be true
    expect(lesson.student_record.record).to include question4
    question5 = lesson.fetch_question
    expect(question5.difficulty).to eq 3
    expect(lesson.question_set.questions).not_to include question5
    lesson.answer_question(question5, question5.correct_answer)
    expect(question5.correctly_answered?).to be true
    expect(lesson.student_record.record).to include question5
    question6 = lesson.fetch_question
    expect(question6.difficulty).to eq 3
    expect(lesson.question_set.questions).not_to include question6
    lesson.answer_question(question6, question6.correct_answer)
    expect(question6.correctly_answered?).to be true
    expect(lesson.student_record.record).to include question6
    expect(lesson.fetch_question).to eq 'You have answered all the questions!'
  end
end