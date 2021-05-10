class AdaptationAlgorithm

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


class DefaultAA < AdaptationAlgorithm
   
  def calculate(student_record)
    change_difficulty(student_record.last_question.difficulty, student_record.last_question_result)
  end

end



class Last3QsAA < AdaptationAlgorithm

  def calculate(student_record)
    change_difficulty(student_record.last_question.difficulty, student_record.three_question_average)
  end

end

class AllQsAA < AdaptationAlgorithm

  def calculate(student_record)
    change_difficulty(student_record.last_question.difficulty, student_record.all_time_average)
  end

end

