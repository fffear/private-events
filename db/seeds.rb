# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(name: "Michael")

event = user.created_events.create(title: "Star Wars Party",
                                   description: "Best event ever",
                                   date: "27/09/2019")
event = user.created_events.create(title: "Star Wars Party 2",
                                   description: "Best event ever 2",
                                   date: "01/10/2019")