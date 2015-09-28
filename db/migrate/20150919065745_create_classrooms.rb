class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.integer :course_id

      t.timestamps null: false
    end
    add_index :classrooms, :course_id
  end
end
