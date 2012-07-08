# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


events = EventType.create([{event: "Wedding"}, {event: "Reception"}, {event: "Engagement"}, {event: "Pre/Post Wedding"}, {event: "New Born"}, {event: "Babies"}])
offerings = Offering.create([{offering: "Creative Photography"}, {offering: "Standard Photography"}, {offering: "Creative Video"}])
services = Service.create([{service: "Digital Photos"}, {service: "Album"}, {service: "Video"}])
