office = Office.find_by(name: "Barksdale")
reqs = Question.create([
  { text: "Pitch", type: :text, key: :pitch },
  { text: "What is the problem you are trying to solve?", type: :text, key: :problem },
  { text: "What is the solution to your problem?", type: :text, key: :solution, office: office },
  { text: "Where are you at on implementing your solution?", type: :text, key: :solution_progress, office: office  },
  { text: "What is the mission impact of your problem?", type: :text, key: :mission_impact, office: office  },
  { text: "How are you currently dealing with your problem? How are your resources/time being spent now?", type: :text, key: :current_working_solution, office: office  },
  { text: "Why should money be invested in your project, rather than a workaround?", type: :text, key: :investment_vs_workaround, office: office  },
  { text: "Have you attempted to self-help your problem?", type: :boolean, key: :attempted_self_help, office: office  },
])
