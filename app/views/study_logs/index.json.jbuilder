json.array!(@study_logs) do |study_log|
  json.extract! study_log, :id, :user_id, :learned_word
  json.url study_log_url(study_log, format: :json)
end
