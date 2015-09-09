json.array!(@courses) do |course|
  json.extract! course, :id, :name, :instructor_id, :session_days, :session_time, :description, :start_date, :end_date, :available, :video_id
  json.url course_url(course, format: :json)
end
