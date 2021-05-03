require 'question_picker'

describe 'question_picker' do
  it 'should return a question of a given difficulty' do
    question = question_picker(3)
    expect(question[:difficulty]).to eq(3)
  end
end