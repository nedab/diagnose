json.array!(@latex) do |latex|
  json.extract! latex, :id
  json.url latex_url(latex, format: :json)
end
