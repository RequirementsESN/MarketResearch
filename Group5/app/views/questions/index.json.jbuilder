json.array!(@questions) do |question|
  json.extract! question, :id, :title, :questionType, :enable, :topic_id
  json.url question_url(question, format: :json)
end
