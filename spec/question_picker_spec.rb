require 'question_picker'

describe 'question_picker' do
  it 'should return a question' do
    expect(QUESTIONS).to include(question_picker)
  end
end