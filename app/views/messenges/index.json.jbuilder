json.array!(@messenges) do |messenge|
  json.extract! messenge, :id, :sender, :content
  json.url messenge_url(messenge, format: :json)
end
