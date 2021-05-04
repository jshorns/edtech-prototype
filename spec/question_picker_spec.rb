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

  describe '#answer_question' do
  before(:each) {
    allow(question1).to receive(:submit_answer).with(:a)
  }
    it 'allows question answer to be submitted' do
      expect(question1).to receive(:submit_answer).with(:a)
      subject.answer_question(question1, :a)
    end
    it 'stores the answered question to a student record array' do
      subject.answer_question(question1, :a)
      expect(subject.student_record).to include(question1)
    end
  end

  describe '#decide_difficulty' do
    before(:each) {
      allow(question3).to receive(:submit_answer).with(question3.correct_answer)
      allow(question3).to receive(:submit_answer).with("not the right answer")
    }
    it 'should return 2 if student record is empty' do
      expect(subject.decide_difficulty).to eq 2
    end
    it 'should return one level up if previous q answered correctly' do
      subject.answer_question(question3, question3.correct_answer)
      allow(question3).to receive(:correctly_answered?).and_return(true)
      expect(question3).to receive(:correctly_answered?)
      expect(subject.decide_difficulty).to eq 3
    end
    it 'should return max difficulty if last answer was correct and already at top level' do
      allow(question5).to receive(:submit_answer).with(question5.correct_answer)
      allow(question5).to receive(:correctly_answered?).and_return(true)
      subject.answer_question(question5, question5.correct_answer)
      expect(subject.decide_difficulty).to eq 3
    end
    it 'should return one level down if previous q answered incorrectly' do
      subject.answer_question(question3, "not the right answer")
      allow(question3).to receive(:correctly_answered?).and_return(false)
      expect(question3).to receive(:correctly_answered?)
      expect(subject.decide_difficulty).to eq 1
    end
  end

end