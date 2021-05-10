require 'adaptation_algorithm'

describe "adaptation algorithms" do

  let(:mid_level_correct_answer) { double(:question, difficulty: 2, :correctly_answered? => true) }
  let(:mid_level_incorrect_answer) { double(:question, difficulty: 2, :correctly_answered? => false) }

  describe DefaultAA do
    let(:good_student_record) { double(:student_record, 
                                :last_question=> mid_level_correct_answer, last_question_result: 100) }
    let(:bad_student_record) { double(:student_record, 
                                :last_question=> mid_level_incorrect_answer, last_question_result: 0) }

    it 'should return prev question difficulty + 1 if last question answered correctly' do
      expect(subject.calculate(good_student_record)).to eq 3
    end
    it 'should return prev question difficulty - 1 if last question answered incorrectly' do
      expect(subject.calculate(bad_student_record)).to eq 1
    end
  end

  #questions over speed of a response here. if a student gets 3 qs wrong in a row, do we want them to fall down two levels? and likewise for going up levels?
  #possibility of percentiles based on difficulty range. assuming that there are no difficulty levels that are blank.
  describe Last3QsAA do
  
    let(:poor_student_record) { double(:student_record, :three_question_average => 30.00, :last_question => mid_level_incorrect_answer) }
    let(:average_student_record) { double(:student_record, :three_question_average => 60.00, :last_question => mid_level_incorrect_answer) }
    let(:good_student_record) { double(:student_record, :three_question_average => 90.00, :last_question => mid_level_correct_answer) }
    
    it 'should go down a level if 3 question average is in bottom third' do
      expect(subject.calculate(poor_student_record)).to eq poor_student_record.last_question.difficulty - 1
    end
    it 'should stay the same if 3 question average is in bottom third' do
      expect(subject.calculate(average_student_record)).to eq poor_student_record.last_question.difficulty
    end
    it 'should go up a level if 3 question average is in top third' do
      expect(subject.calculate(good_student_record)).to eq poor_student_record.last_question.difficulty + 1
    end

  end 

  describe AllQsAA do
  
  let(:poor_student_record) { double(:student_record, :all_time_average => 30.00, :last_question => mid_level_incorrect_answer) }
  let(:average_student_record) { double(:student_record, :all_time_average => 60.00, :last_question => mid_level_incorrect_answer) }
  let(:good_student_record) { double(:student_record, :all_time_average => 90.00, :last_question => mid_level_correct_answer) }
  
  it 'should go down a level if 3 question average is in bottom third' do
    expect(subject.calculate(poor_student_record)).to eq poor_student_record.last_question.difficulty - 1
  end
  it 'should stay the same if 3 question average is in bottom third' do
    expect(subject.calculate(average_student_record)).to eq poor_student_record.last_question.difficulty
  end
  it 'should go up a level if 3 question average is in top third' do
    expect(subject.calculate(good_student_record)).to eq poor_student_record.last_question.difficulty + 1
  end

end 
end