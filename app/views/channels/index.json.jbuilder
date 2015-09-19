json.array!(@channels) do |channel|
  json.extract! channel, :id, :course_id, :belongs_to, :has_one, :has_one
  json.url channel_url(channel, format: :json)
end
