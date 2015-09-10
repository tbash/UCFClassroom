json.array!(@courses) do |course|
  json.extract! course, :id, :name, :mon, :tue, :wed, :thu, :session_time, :session_time_out, :description, :start_date, :end_date, :in_session, :video_id
  json.url course_url(course, format: :json)
end
