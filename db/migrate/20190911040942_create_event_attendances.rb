class CreateEventAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :event_attendances do |t|
      t.integer :attendee_id, null: false
      t.integer :attended_event_id, null: false

      t.timestamps
    end

    add_index :event_attendances, :attendee_id
    add_index :event_attendances, [:attended_event_id, :attendee_id], unique: true
  end
end
