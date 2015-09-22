class CreateMessenges < ActiveRecord::Migration
  def change
    create_table :messenges do |t|
      t.string :sender
      t.text :content

      t.timestamps null: false
    end
  end
end
