require 'question'

describe Question do

  subject { described_class.new(question_text: "Is pudding a cat or a dog?", 
                                      answer_a: "cat", 
                                      answer_b: "dog", 
                                      answer_c: "monkey", 
                                      answer_d: "fish", 
                                    difficulty: 1, 
                                correct_answer: :a
                                )}


  it { is_expected.to respond_to :question_text }
  it { is_expected.to respond_to :answer_options }
  it { is_expected.to respond_to :difficulty }
  it { is_expected.to respond_to :correct_answer }

  describe '#student_answer' do
    it 'assigns an answer value to the student answer attribute' do
      subject.submit_answer(:a)
      expect(subject.student_answer).to eq :a
    end
  end

  describe '#correctly_answered?' do
    it 'returns nil if the student has not submitted an answer yet' do
      expect(subject.correctly_answered?).to be nil
    end
    it 'returns true if the student submitted the correct answer' do
      subject.submit_answer(:a)
      expect(subject.correctly_answered?).to be true
    end
    it 'returns false if the student did not submit the correct answer' do
      subject.submit_answer(:d)
      expect(subject.correctly_answered?).to be false
    end
  end

end