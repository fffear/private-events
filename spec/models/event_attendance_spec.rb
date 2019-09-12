# == Schema Information
#
# Table name: event_attendances
#
#  id                :bigint           not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  attended_event_id :integer          not null
#  attendee_id       :integer          not null
#
# Indexes
#
#  index_event_attendances_on_attended_event_id_and_attendee_id  (attended_event_id,attendee_id) UNIQUE
#  index_event_attendances_on_attendee_id                        (attendee_id)
#

require 'rails_helper'

RSpec.describe EventAttendance, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:event) do
    user.created_events.create(date: 2.days.from_now,
                               title: "Test Title",
                               description: "Test description")
  end
  
  
  it 'expect #attendee to be instance of user' do
    event_attendance = EventAttendance.create(attendee_id: user.id, attended_event_id: event.id)
    expect(event_attendance.attendee).to be_instance_of(User)
  end

  it 'expect #attended_event to be instance of user' do
    event_attendance = EventAttendance.create(attendee_id: user.id, attended_event_id: event.id)
    expect(event_attendance.attended_event).to be_instance_of(Event)
  end

  it 'attendee can\'t attend event more than once' do
    event_attendance_1 = EventAttendance.create(attendee_id: user.id, attended_event_id: event.id)
    event_attendance_2 = EventAttendance.new(attendee_id: user.id, attended_event_id: event.id)
    event_attendance_2.save

    expect(event_attendance_2.errors.full_messages).to_not be_empty
  end
end
