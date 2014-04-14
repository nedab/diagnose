Role.create!([
  {name: "admin", resource_id: nil, resource_type: nil},
  {name: "user", resource_id: nil, resource_type: nil},
  {name: "author", resource_id: nil, resource_type: nil}
])
User.create!([
  {email: "admin@example.com", encrypted_password: "$2a$10$nqgM.v7WQGcK6vipnvm.XeDIon/yGIQ9IihbsJ7a3mMpeu8xN55xa", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-04-14 10:23:30", last_sign_in_at: "2014-04-14 10:23:30", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", username: nil}
])
Category.create!([
  {title: "Mathematik", description: "Sek I"},
  {title: "Chemie", description: "Sek I"}
])
Question.create!([
  {title: "Grundrechenarten", number: "1.0", content: "1+2", answer1: "2", answer2: "4", answer3: "3", answer4: "1", right: 3, category_id: 1, exercise: "\\begin{question} Addiere 1+1,  \\begin{answer} 2 \\end{answer} \\end{question}"},
  {title: "Grundrechenarten", number: "1.01", content: "1-5", answer1: "6", answer2: "4", answer3: "-4", answer4: "0", right: 3, category_id: 1, exercise: "\\begin{question} Rechne: 4+5 \\begin{answer} 9 \\end{answer} \\end{question}"}
])
