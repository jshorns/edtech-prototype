# edtech-prototype

Prototype back-end for educational software/web app that would facilitate personalised learning, customising question delivery to previous student performance.

Designed in Ruby with a view to ultimately turning this into an app with Rails or Sinatra.

## MVP

a program that gives students a follow-up question from an appropriate category of difficulty, based on their previous performance.

## User Stories

*As a student,
so I can stretch and consolidate my understanding where necessary,
I want to be assigned a question of the appropriate level.*

*As a teacher, 
so I can give students the right level of question for their understanding,
I want to input customised questions and answers.*

*As a teacher, 
so I can assess student understanding,
I want to see a question and answer history for a student's session.*


for beyond MVP but so i don't forget:

*As a teacher, 
so I can give students new challenges,
I don't want students to see questions they have answered before.*

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
 
