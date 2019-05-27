# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Event.delete_all

# User creation
User.create!([
  {email: "donald@duck.com", password: "123456", name: "Donald Duck"},
  {email: "bugs@bunny.com", password: "123456", name: "Bugs Bunny"},
  {email: "micky@mouse.com", password: "123456", name: "Micky Mouse"},
  {email: "winnie@pooh.com", password: "123456", name: "Winnie Pooh"}
])

puts 'created users successfully'

# Event Creation
User.find_by(name: 'Micky Mouse').events.create!([
  {date: Date.new(2001,2,3)  ,address:'Address 01', name: "Event 01", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."},
  {date: Date.new(2022,2,3)  ,address:'Address 02', name: "Event 02", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."},
  {date: Date.new(2022,7,3)  ,address:'Address 03', name: "Event 03", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."},
  {date: Date.new(2022,7,3)  ,address:'Address 04', name: "Event 04", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."}
])

User.find_by(name: 'Micky Mouse').events.create!([
  {date: Date.new(2022,7,3)  ,address:'Address 05', name: "Event 05", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."},
  {date: Date.new(2022,7,3)  ,address:'Address 06', name: "Event 06", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."},
  {date: Date.new(2022,7,3)  ,address:'Address 07', name: "Event 07", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."},
  {date: Date.new(2022,7,3)  ,address:'Address 08', name: "Event 08", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."}
])

User.find_by(name: 'Bugs Bunny').events.create!([
  {date: Date.new(2023,2,3)  ,address:'Address 09', name: "Event 09", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."},
  {date: Date.new(2005,2,3)  ,address:'Address 10', name: "Event 10", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."},
  {date: Date.new(2023,2,3)  ,address:'Address 11', name: "Event 11", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."},
  {date: Date.new(2005,2,3)  ,address:'Address 12', name: "Event 12", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."}
])

User.find_by(name: 'Donald Duck').events.create!([
  {date: Date.new(2020,2,3) , address:'Address 13 ', name: "Event 13", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."},
  {date: Date.new(2017,2,3)  ,address:'Address 14 ', name: "Event 14", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."},
  {date: Date.new(2023,2,3)  ,address:'Address 15 ', name: "Event 15", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."},
  {date: Date.new(2005,2,3)  ,address:'Address 16 ', name: "Event 16", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."}
])


puts 'created events successfully'

# Event Attendes
Event.first.attendees << User.find_by(name: 'Bugs Bunny')
Event.first.attendees << User.find_by(name: 'Donald Duck')
Event.first.attendees << User.find_by(name: 'Micky Mouse')
Event.first.attendees << User.find_by(name: 'Winnie Pooh')

puts 'created attendees for the first event successfully'

Event.last.attendees << User.find_by(name: 'Bugs Bunny')
Event.last.attendees << User.find_by(name: 'Donald Duck')
Event.last.attendees << User.find_by(name: 'Micky Mouse')
Event.last.attendees << User.find_by(name: 'Donald Duck')
Event.last.attendees << User.find_by(name: 'Winnie Pooh')

puts 'created attendees for the second event successfully'