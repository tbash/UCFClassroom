unless Rails.env.production?
  users_seed_file = File.join(Rails.root, 'db','seeds', 'users.yml')
  users_config = YAML::load_file(users_seed_file)
  User.create(users_config["users"])

  courses_seed_file = File.join(Rails.root, 'db','seeds', 'courses.yml')
  courses_config = YAML::load_file(courses_seed_file)
  Course.create(courses_config["courses"])
  Slide.create(courses_config["slides"])
  Assignment.create(courses_config["assignments"])

  users_config["enrollments"].each do |enroll|
    user = User.find(enroll["user_id"].to_i)
    course = Course.find(enroll["courses_id"].to_i)
    user.courses << course
    if user.instructor?
      course.instructor_id = user.id
      course.save
    end
  end
end

