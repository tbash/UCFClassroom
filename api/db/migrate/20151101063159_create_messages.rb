class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.string :username
      t.belongs_to :user,   index: true, foreign_key: true
      t.belongs_to :course, index: true, foreign_key: true

      t.timestamps
    end
  end
end
