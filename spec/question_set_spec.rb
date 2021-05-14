require 'question_set'

describe QuestionSet do
  let(:question1) { double(:question, difficulty: 1) }
  let(:question2) { double(:question, difficulty: 2) }
  let(:question3) { double(:question, difficulty: 3) }
  let(:qs) { described_class.new(question1, question2, question3)}

  describe '#questions' do
    it 'should return an array' do
      expect(subject.questions).to be_an_instance_of Array
    end
    it 'should return an array of questions when they are passed as initialize arguments' do
      expect(qs.questions.last).to eq question3
    end
  end

  describe '#complete' do
    it 'returns true if there are no questions in the array' do
      empty_qs = described_class.new
      expect(empty_qs.complete?).to eq true
    end
  end

  describe 'min_level' do
    it 'should return the minimum difficulty level in a given question set' do
      expect(qs.min_level).to eq 1
    end
  end

  describe 'max_level' do
    it 'should return the maximum difficulty level in a given question set' do
      expect(qs.max_level).to eq 3
    end
  end

  describe 'range' do
    it 'should return the range of difficulty within a given question set' do
      expect(qs.range).to eq 3
    end
  end
end