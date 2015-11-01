class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email,                 null: false, default: ""
      t.string :pid
      t.string :authentication_token
      t.string :password_digest
      t.integer :role

      t.timestamps
      t.index :pid,                     unique: true
      t.index :email,                   unique: true
      t.index :username,                unique: true
      t.index :authentication_token,    unique: true
    end
  end
end
