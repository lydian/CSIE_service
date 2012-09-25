class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :assignment_id
      t.datetime :time
      t.string :status

      t.timestamps
    end
  end
end
