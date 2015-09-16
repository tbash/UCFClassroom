class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :instructor_id
      t.boolean :mon
      t.boolean :tue
      t.boolean :wed
      t.boolean :thu
      t.time :session_time
      t.time :session_time_out
      t.text :description
      t.date :start_date
      t.date :end_date
      t.boolean :in_session
      t.string :channel_id

      t.timestamps null: false
    end
  end
end
