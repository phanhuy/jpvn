json.array!(@goals) do |goal|
  json.extract! goal, :id, :user_id, :average_score, :test_done, :test_cancelled, :status, :started_at, :deadline
  json.url goal_url(goal, format: :json)
end
