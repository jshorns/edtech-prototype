require 'student_record'

describe StudentRecord do
  
let(:correct_answer) { double(:question, :correctly_answered? => true) }
let(:incorrect_answer) { double(:question, :correctly_answered? => false) }



  it { is_expected.to respond_to(:record) }
  it { is_expected.to respond_to(:last_question_result) }
  it { is_expected.to respond_to(:three_question_average) }
  it { is_expected.to respond_to(:all_time_average) }

  describe '#first_question?' do
    it 'returns true if no questions have yet been answered' do
      expect(subject.first_question?).to be true
    end
  end

  describe '#last_question' do
    it 'returns the most recently answered question' do
      subject.add_question(correct_answer)
      expect(subject.last_question).to eq correct_answer
    end
  end

  
  describe '#add_question' do
    it 'pushes a question to the @record array' do
      subject.add_question(correct_answer)
      expect(subject.record).to include(correct_answer)
    end
  end

  describe '#last question result' do
    it 'should return 100 if last question correctly answered' do
      subject.add_question(correct_answer)
      expect(subject.last_question_result).to eq 100
    end
    it 'should return 0 if last question incorrectly answered' do
      subject.add_question(incorrect_answer)
      expect(subject.last_question_result).to eq 0
    end

  end

  describe '#all_time_average' do
    it 'should return 90 if 10 questions, 9 correctly answered' do
      9.times { subject.add_question(correct_answer) }
      subject.add_question(incorrect_answer)
      expect(subject.all_time_average).to eq 90
    end
    it 'should return 10 if 10 questions, 1 correctly answered' do
      9.times { subject.add_question(incorrect_answer) }
      subject.add_question(correct_answer)
      expect(subject.all_time_average).to eq 10
    end

  end

  describe '#three_question_average' do
  it 'should return 66.67 if 10 questions, of last 3 questions, 2 correctly answered' do
    9.times { subject.add_question(correct_answer) }
    subject.add_question(incorrect_answer)
    expect(subject.three_question_average).to eq 66.67
  end
  it 'should return 33.33 if 10 questions, of last 3, 1 correctly answered' do
    9.times { subject.add_question(incorrect_answer) }
    subject.add_question(correct_answer)
    expect(subject.three_question_average).to eq 33.33
  end

end

  

end
