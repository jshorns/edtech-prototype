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
  let(:student_record) { double(:student_record) }
  let(:adaptation_algorithm) { double(:adaptation_algorithm) }
  subject { described_class.new(question_set, student_record, adaptation_algorithm) }

  describe '#fetch_question' do

    it 'should return a question of difficulty calculated by the algorithm' do
      allow(adaptation_algorithm).to receive(:calculate).and_return(3)
      question = subject.fetch_question
      expect(question.difficulty).to eq(3)
    end
    it 'should return a question of max difficulty if algorithm calculates higher than max level' do
      allow(adaptation_algorithm).to receive(:calculate).and_return(4)
      question = subject.fetch_question
      expect(question.difficulty).to eq(3)
    end

  end

  describe '#answer_question' do

  before(:each) {
    allow(question1).to receive(:submit_answer).with(:a)
  }

    it 'allows question answer to be submitted to question and added to record' do
      expect(student_record).to receive(:add_question).with( question1)
      expect(question1).to receive(:submit_answer).with(:a)
      subject.answer_question(question1, :a)
    end

  end


end