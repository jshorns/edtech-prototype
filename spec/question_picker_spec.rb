require 'question_picker'

describe QuestionPicker do
  let(:question1) { double(:question, question_text: "Is pudding a cat or a dog?", 
                                      answer_a: "cat", 
                                      answer_b: "dog", 
                                      answer_c: "monkey", 
                                      answer_d: "fish", 
                                    difficulty: 1, 
                                correct_answer: :a
                                )}
  let(:question2) { double(:question, question_text: "Is Uncle Matthew a cat or a monkey?", 
                                      answer_a: "monkey", 
                                      answer_b: "chicken", 
                                      answer_c: "dinosaur", 
                                      answer_d: "cat", 
                                    difficulty: 3, 
                                correct_answer: :d
                                )}
   let(:question3) { double(:question, question_text: "What kind of animal is Sachin?", 
                                      answer_a: "gibbon", 
                                      answer_b: "tapir", 
                                      answer_c: "snail", 
                                      answer_d: "cat", 
                                    difficulty: 2, 
                                correct_answer: :d
                                )}
  let(:question4) { double(:question, question_text: "What kind of animal is Scheana?", 
                                      answer_a: "unicorn", 
                                      answer_b: "grasshopper", 
                                      answer_c: "cat", 
                                      answer_d: "ostrich", 
                                    difficulty: 1, 
                                correct_answer: :c
                                )}
  let(:question5) { double(:question, question_text: "Who is Bubbles?", 
                                      answer_a: "a spy", 
                                      answer_b: "a kitten", 
                                      answer_c: "a creature of the deep", 
                                      answer_d: "a charlatan", 
                                    difficulty: 3, 
                                correct_answer: :b
                                )}
                                
  let(:question_set)  { [question1, question2, question3, question4, question5] }
  subject { described_class.new(question_set) }

  describe '#fetch_question' do
    it 'should return a question of a given difficulty' do
      question = subject.fetch_question(3)
      expect(question.difficulty).to eq(3)
    end
  end

end