class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.integer :course_id
      t.datetime :date

      t.timestamps
    end
  end
end
