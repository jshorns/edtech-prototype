require 'adaptation_algorithm'

describe AdaptationAlgorithm do
  describe '#default' do
    let(:mid_level_correct_answer) { double(:question, difficulty: 2, :correctly_answered? => true) }
    let(:good_student_record) { double(:student_record, 
                                :last_question=> mid_level_correct_answer) }
    let(:mid_level_incorrect_answer) { double(:question, difficulty: 2, :correctly_answered? => false) }
    let(:bad_student_record) { double(:student_record, 
                                :last_question=> mid_level_incorrect_answer) }

    it 'should return prev question difficulty + 1 if last question answered correctly' do
      expect(subject.default(good_student_record)).to eq 3
    end
    it 'should return prev question difficulty - 1 if last question answered incorrectly' do
      expect(subject.default(bad_student_record)).to eq 1
    end
  end
end