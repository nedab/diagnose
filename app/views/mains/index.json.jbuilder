json.array!(@mains) do |main|
  json.extract! main, :id, :title, :content
  json.url main_url(main, format: :json)
end
