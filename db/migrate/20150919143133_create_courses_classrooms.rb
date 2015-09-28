class CreateCoursesClassrooms < ActiveRecord::Migration
  def change
    create_table :courses_classrooms, id: false do |t|
      t.belongs_to :course, index: true
      t.belongs_to :classroom, index: true
    end
  end
end
