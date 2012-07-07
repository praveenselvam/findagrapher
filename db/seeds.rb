# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


events = EventType.create([{event: "Wedding"}, {event: "Reception"}, {event: "Engagement"}, {event: "Pre/Post Wedding"}, {event: "New Born"}, {event: "Babies"}])
services = Offering.create([{event: "Creative Photography"}, {event: "Standard Photography"}, {event: "Creative Video"}])
services = Service.create([{event: "Digital Photos"}, {event: "Album"}, {event: "Video"}])