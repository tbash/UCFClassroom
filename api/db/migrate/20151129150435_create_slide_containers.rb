class CreateSlideContainers < ActiveRecord::Migration
  def change
    create_table :slide_containers do |t|
      t.integer :course_session_id
      t.belongs_to :course, index: true, foreign_key: true

      t.timestamps
    end
  end
end
