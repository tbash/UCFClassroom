class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.date :add_drop_by
      t.boolean :available

      t.timestamps null: false
    end
  end
end
