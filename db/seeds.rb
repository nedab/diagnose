Role.create!([
  {name: "admin", resource_id: nil, resource_type: nil},
  {name: "user", resource_id: nil, resource_type: nil},
  {name: "author", resource_id: nil, resource_type: nil}
])
Category.create!([
  {title: "Mathematik", description: "Sek I"},
  {title: "Chemie", description: "Sek I"}
])
Question.create!([
  {title: "Grundrechenarten", number: "1.0", content: "1+2", answer1: "2", answer2: "4", answer3: "3", answer4: "1", right: 3, category_id: 1, exercise: "\\begin{question} Addiere 1+1,  \\begin{answer} 2 \\end{answer} \\end{question}"},
  {title: "Grundrechenarten", number: "1.01", content: "1-5", answer1: "6", answer2: "4", answer3: "-4", answer4: "0", right: 3, category_id: 1, exercise: "\\begin{question} Rechne: 4+5 \\begin{answer} 9 \\end{answer} \\end{question}"}
])
