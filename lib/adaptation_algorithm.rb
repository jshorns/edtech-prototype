class AdaptationAlgorithm
   
  def default(student_record)
    change_difficulty(student_record.last_question.difficulty, student_record.last_question_result)
  end

  # for full record average - refactor the switch here in to a private method which then just gets called on either 3 question average or total average

  def last_three_qs(student_record)
    change_difficulty(student_record.last_question.difficulty, student_record.three_question_average)
  end

  def all_questions(student_record)
    change_difficulty(student_record.last_question.difficulty, student_record.all_time_average)
  end

  private

  def change_difficulty(current_difficulty, average)
    case average
    when  0..35
      current_difficulty - 1
    when 35..65
      current_difficulty
    when 65..100
      current_difficulty + 1
    end
  end

end