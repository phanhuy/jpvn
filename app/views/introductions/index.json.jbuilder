json.array!(@introductions) do |introduction|
  json.extract! introduction, :id, :content
  json.url introduction_url(introduction, format: :json)
end
