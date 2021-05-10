require 'student_record'

describe StudentRecord do
  subject { described_class.new }

  it { is_expected.to respond_to(:record) }
  it { is_expected.to respond_to(:last_question_result) }
  it { is_expected.to respond_to(:three_question_average) }
  it { is_expected.to respond_to(:all_time_average) }

end
