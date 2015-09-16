# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Course.create(name: 'COP 4331C', mon: false, tue: true, wed: false, thu: true, session_time: '2000-01-01 10:30:00', session_time_out: '2000-01-01 11:45:00', description: 'Processes of Object Oriented Software Development', start_date: '2016-01-08', end_date: '2016-05-04', in_session: true, channel_id: 'M7lc1UVf-VE')
Course.create(name: 'EEE 3307C', mon: true, tue: false, wed: true, thu: false, session_time: '2000-01-01 09:00:00', session_time_out: '2000-01-01 10:15:00', description: 'Electronics I', start_date: '2016-01-08', end_date: '2016-05-04', in_session: true, channel_id: 'M7lc1UVf-VE')
User.create(email: 'admin@ucf.edu', password: 'Password1', password_confirmation: 'Password1', role: 0)
