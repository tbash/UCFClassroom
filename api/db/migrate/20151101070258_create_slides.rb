class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.integer :course_session
      t.text :content
      t.belongs_to :course, index: true, foreign_key: true

      t.timestamps
    end
  end
end
