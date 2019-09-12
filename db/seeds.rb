# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create_event(user)
  user.created_events.create(title: Faker::Lorem.words.map(&:capitalize).join(" "),
                             description: Faker::Lorem.sentence(word_count: 10),
                             date: 1.day.from_now)
end

3.times do
  user = User.create(name: Faker::Name.first_name)
  event = create_event(user)
end

ea = EventAttendance.create(attended_event_id: Event.second.id, attendee_id: User.first.id)
ea_2 = EventAttendance.create(attended_event_id: Event.first.id, attendee_id: User.third.id)
ea_3 = EventAttendance.create(attended_event_id: Event.third.id, attendee_id: User.second.id)