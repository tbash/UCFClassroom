class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.integer :course_id

      t.timestamps null: false
    end
    add_index :channels, :course_id
  end
end
