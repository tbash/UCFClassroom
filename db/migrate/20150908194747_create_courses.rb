class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :instructor_id
      t.string :session_days
      t.time :session_time
      t.text :description
      t.date :start_date
      t.date :end_date
      t.boolean :available
      t.string :video_id

      t.timestamps null: false
    end
  end
end
