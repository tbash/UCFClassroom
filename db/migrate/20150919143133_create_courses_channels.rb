class CreateCoursesChannels < ActiveRecord::Migration
  def change
    create_table :courses_channels, id: false do |t|
      t.belongs_to :course, index: true
      t.belongs_to :channel, index: true
    end
  end
end
