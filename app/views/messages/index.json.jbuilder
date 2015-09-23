json.array!(@messages) do |message|
  json.extract! message, :id, :user_id, :channel_id, :content
  json.url message_url(message, format: :json)
end
