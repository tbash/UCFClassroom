class AddSessionTimeOutToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :session_time_out, :time
  end
end
