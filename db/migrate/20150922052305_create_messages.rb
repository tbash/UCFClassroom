class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :channel_id
      t.text :content

      t.timestamps null: false
    end
    add_index :messages, :channel_id
    add_index :messages, :user_id
  end
end
