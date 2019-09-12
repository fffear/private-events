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

FactoryBot.define do
  factory :event_attendance do
    
  end
end
