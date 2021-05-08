class AdaptationAlgorithm
   
  def default(student_record)
    if student_record.last_question.correctly_answered?
      student_record.last_question.difficulty + 1
    else
      student_record.last_question.difficulty - 1
    end
  end

end