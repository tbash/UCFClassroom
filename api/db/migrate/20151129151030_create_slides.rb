class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.integer :order_no
      t.text :content
      t.belongs_to :slide_container, index: true, foreign_key: true

      t.timestamps
    end
  end
end
