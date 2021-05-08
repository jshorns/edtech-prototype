class AdaptationAlgorithm
   
  def default(student_record)
    if student_record.last_question.correctly_answered?
      student_record.last_question.difficulty + 1
    else
      student_record.last_question.difficulty - 1
    end
  end

  def last_three_qs(student_record)
    case student_record.three_question_average
    when  0..35
      student_record.last_question.difficulty - 1
    when 35..65
      student_record.last_question.difficulty 
    when 65..100
      student_record.last_question.difficulty + 1
    end
  end
  
end