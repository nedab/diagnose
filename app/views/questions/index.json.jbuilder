json.array!(@questions) do |question|
  json.extract! question, :id, :title, :number, :content, :answer1, :answer2, :answer3, :answer4, :right
  json.url question_url(question, format: :json)
end
