# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
unless Rails.env.production?
  Course.create(name: 'COP 4331C', mon: false, tue: true, wed: false, thu: true, session_time: '2000-01-01 10:30:00', session_time_out: '2000-01-01 11:45:00', description: 'Processes of Object Oriented Software Development', start_date: '2016-01-08', end_date: '2016-05-04', in_session: true)
  Channel.create(id: 1, course_id: 1)
  Course.create(name: 'EEE 3307C', mon: true, tue: false, wed: true, thu: false, session_time: '2000-01-01 09:00:00', session_time_out: '2000-01-01 10:15:00', description: 'Electronics I', start_date: '2016-01-08', end_date: '2016-05-04', in_session: true)
  Channel.create(id: 2, course_id: 2)

  User.create(email: 'instructor@ucf.edu', password: 'Password1', password_confirmation: 'Password1', first_name: 'Tim', last_name: 'Burton', ucf_id: 'ti121212')
  User.create(email: 'student@knights.ucf.edu', password: 'Password1', password_confirmation: 'Password1', first_name: 'Bill', last_name: 'Clinton', ucf_id: 'bi121212')
  User.create(email: 'student2@knights.ucf.edu', password: 'Password1', password_confirmation: 'Password1', first_name: 'Elliot', last_name: 'Hilton', ucf_id: 'el121212')
end

User.create(email: 'admin@ucf.edu', password: 'Password1', password_confirmation: 'Password1', role: 0)
