json.array!(@courses) do |course|
  json.extract! course, :id, :name, :description, :add_drop_by, :available
  json.url course_url(course, format: :json)
end
