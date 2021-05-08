# edtech-prototype

Prototype back-end for educational software/web app that would facilitate personalised learning, customising question delivery to previous student performance.

Designed in Ruby with a view to ultimately turning this into an app with Rails or Sinatra.

to do - add complexity to algorithm based on entire lesson performance. students still see prev questions. two version of algorithm - entire lesson and last 3 questions.

## MVP

a program that gives students a follow-up question from an appropriate category of difficulty, based on their previous performance.

## User Stories

_As a student,
so I can challenge my learning,
I want to be able to answer multiple choice questions._

_As a student,
so I can assess my learning,
I want to see if my answers were correct or not._

_As a student,
so I can stretch and consolidate my understanding where necessary,
I want to be assigned a question of the appropriate level._

_As a teacher,
so I can give students the right level of question for their understanding,
I want to input customised questions and answers._

_As a teacher,
so I can assess student understanding,
I want to see a question and answer history for a student's session._

for beyond MVP but so i don't forget:

_As a teacher,
so I can give students new challenges,
I don't want students to see questions they have answered before._

(do we want this to be a feature? or only if they have answered correctly? what would the program do when a student answers incorrectly other than respond with the next question? would it tell them the right answer, or point them to a resource to look at to find out the right answer?)

## Classes

student_record: knows students previous answers, calculates average
question: knows the question, knows the possible answers, knows the right answer
question_set: a collection of questions for a given topic or lesson
question_picker: chooses a question from the question set based on the student record
lesson: takes on a question set, initializes QP and student_record

<img width="600" alt="Screenshot 2021-05-02 at 17 27 20" src="https://user-images.githubusercontent.com/48794743/116820232-d054c980-ab6b-11eb-8a7d-764b30b23927.png">

```
alias question_picker="qp"
alias student_record="student_record "
alias question="question"
alias question_set="qs"
alias lesson="lesson"

lesson->lesson:"initializes qp and student record, and with question set as argument"
lesson->qp: "fetch a starter question based on average difficulty"
qp=>question: "fetches and displays"
question-->question: "assesses if answered correctly"
question-->student_record: "record question and answer history"
lesson->qp: "fetch another question based on student record average"

```

## approach

- I'm going to try and TDD this prototype in Ruby. I plan to begin with the question picker as a method and work up from there.
- I quickly discovered I couldn't test very much without some sample questions, which I then wrote as an array of hashes (obviously in the real deal they wouldn't be cat themed). Through trying to play around with this I also discovered that irb can't access local variables in required files, but it can access constants, which I didn't know!
- Having got the question picker to return one of a set of questions, I then modified it to return a question of a given difficulty. The next step would be to modify the algorithm to calculate the required difficulty based on the student's previous answers. I realised at this point that refactoring would be necessary and I needed to start developing my OOP structure. I realised too that I had misssed a crucial element of my planning and user stories - the aspect of students being able to input answers, and being able to see if they were correct or not! This being essential to the functioning of the software, I decided to reorientate my approach to prioritise this, writing a couple of extra user stories and amending my sequence diagram.
- Having completed this question class with basic functionality, I implemented the methods for submitting answers through the question picker, and storing an answer history. I then implemented a basic algorithm for leveling up if the last answer was correct, and down if it was incorrect. I added to this a guard to stay at the maximum level if there and correct, or at min level if there and incorrect. I then did substantial refactoring to remove magic numbers and follow SRP. I got blocked for a bit by a bug but was able to resolve this by getting visibility on the problem.
- We then discussed the idea of having different algorithm options for picking the next question. I realised at this point that it would make far more sense to have the algorithm itself be its own class, with the options contained within that class. The responsibility of the question picker would then simply be to deploy the selected algorithim, rather than perform any calculations. Rather than tamper with my existing, functional code, I decided to write and test the algorithim class first. This also helped me think through designing the student class - this is where the responsibility for calculating averages will lie, and the algorithm will simply retrieve those averages from the record.

test questions:

Is pudding a cat or a dog?

a) cat b) dog c) monkey d) fish

Is Uncle Matthew a cat or a monkey?

a) monkey b) parakeet c) dinosaur d) chicken

What kind of animal is Sachin?

a) gibbon b) tapir c) snail d) cat

What kind of animal is Scheana?

a) unicorn b) grasshopper c) cat d) ostrich

Who is Bubbles?

a) a spy b) a kitten c) a creature of the deep d) a charlatan
