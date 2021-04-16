reqs = Question.create([
  { text: "Pitch", type: :text },
  { text: "What is the problem you are trying to solve?", type: :text },
  { text: "What is the solution to your problem?", type: :text },
  { text: "Where are you at on implementing your solution?", type: :text },
  { text: "What is the mission impact of your problem?", type: :text },
  { text: "How are you currently dealing with your problem? How are your resources/time being spent now?", type: :text },
  { text: "Why should money be invested in your project, rather than a workaround?", type: :text },
  { text: "Have you attempted to self-help your problem?", type: :boolean },
])