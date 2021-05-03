question1 = {
  question: "Is pudding a cat or a dog?",
  answers: {
    a: "cat",
    b: "dog",
    c: "monkey",
    d: "fish"
  },
  difficulty: 1,
  correct_answer: :a
}
question2 = {
  question: "Is Uncle Matthew a cat or a monkey?",
  answers: {
    a: "monkey",
    b: "chicken",
    c: "dinosaur",
    d: "cat"
  },
  difficulty: 3,
  correct_answer: :d
}
question3 = {
  question: "What kind of animal is Sachin?",
  answers: {
    a: "gibbon",
    b: "tapir",
    c: "snail",
    d: "cat"
  },
  difficulty: 2,
  correct_answer: :d
}
question4 = {
  question: "What kind of animal is Scheana?",
  answers: {
    a: "unicorn",
    b: "grasshopper",
    c: "cat",
    d: "ostrich"
  },
  difficulty: 1,
  correct_answer: :c
}
question5 = {
  question: "Who is Bubbles?",
  answers: {
    a: "a spy",
    b: "a kitten",
    c: "a creature of the deep",
    d: "a charlatan"
  },
  difficulty: 3,
  correct_answer: :b
}

QUESTIONS = [question1, question2, question3, question4, question5]

def question_picker(difficulty)
  QUESTIONS.select { |question| question[:difficulty] == difficulty }.sample
end
