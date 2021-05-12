require 'question_set'

describe QuestionSet do
  let(:question1) { double(:question, difficulty: 1) }
  let(:question2) { double(:question, difficulty: 2) }
  let(:question3) { double(:question, difficulty: 3) }

  describe '#questions' do
    it 'should return an array' do
      expect(subject.questions).to be_an_instance_of Array
    end
    it 'should return an array of questions when they are passed as initialize arguments' do
      qs = described_class.new(question1, question2, question3)
      expect(qs.questions.last).to eq question3
    end
  end
end