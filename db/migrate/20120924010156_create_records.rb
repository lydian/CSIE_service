class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :assignment_id
      t.integer :calendar_id
      t.string :status

      t.timestamps
    end
  end
end
