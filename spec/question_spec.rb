require 'question'

describe Question do

  subject { described_class.new(question_text: "Is pudding a cat or a dog?", 
                                      answer_a: "cat", 
                                      answer_b: "dog", 
                                      answer_c: "monkey", 
                                      answer_d: "fish", 
                                    difficulty: 1, 
                                correct_answer: :a
                                )}


  it { is_expected.to respond_to :question_text }
  it { is_expected.to respond_to :answer_options }
  it { is_expected.to respond_to :difficulty }
  it { is_expected.to respond_to :correct_answer }

end