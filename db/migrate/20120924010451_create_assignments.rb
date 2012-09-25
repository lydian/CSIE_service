class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :course_id
      t.integer :student_id
      t.string :status

      t.timestamps
    end
  end
end
