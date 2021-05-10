require 'student_record'

describe StudentRecord do
  let(:question1) { double(:question, question_text: "Is pudding a cat or a dog?", 
  answer_a: "cat", 
  answer_b: "dog", 
  answer_c: "monkey", 
  answer_d: "fish", 
difficulty: 1, 
correct_answer: :a
)}

  it { is_expected.to respond_to(:record) }
  it { is_expected.to respond_to(:last_question_result) }
  it { is_expected.to respond_to(:three_question_average) }
  it { is_expected.to respond_to(:all_time_average) }

  describe '#add_question' do
    it 'pushes a question to the @record array' do
      subject.add_question(question1)
      expect(subject.record).to include(question1)
    end
  end

  

end
