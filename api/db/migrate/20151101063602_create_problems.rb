class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.integer :number
      t.string :question
      t.string :student_answer
      t.string :correct_answer
      t.integer :type
      t.belongs_to :assignment, index: true, foreign_key: true

      t.timestamps
    end
  end
end
