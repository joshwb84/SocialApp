# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Deletes everything from the database so that you start fresh
puts "Deleting all records from the database..."
Event.delete_all
User.delete_all
#The following lines are static lists. Don't need to wipe them clean each time
RsvpCap.delete_all  
Frequency.delete_all
Category.delete_all


# Create the users
puts "Creating your Users dog..."
user_one = User.create(name: "John Billy",email: "josh@aol.com",description: "1",password: "1234",facebook:"http://www.facebook.com/joshua.borin",tandc: "1")
user_two = User.create(name: "Alex Smart",email: "smartalex@gmail.com",description: "2",password: "AAlex123",facebook:"http://www.facebook.com",tandc: "1")
user_three = User.create(name: "Steph Graph",email: "Graphme@hotmail.com",description: "3",password: "Steph123",facebook:"http://www.facebook.com",tandc: "1")
user_four = User.create(name: "Brian Eno",email: "EnosMusic@yahoo.com",description: "4",password: "BrianKnowsPW",facebook:"http://www.facebook.com",tandc: "1")
user_five = User.create(name: "Laura bobbit",email: "laura@gmail.com",description: "5",password: "lauraspassword",facebook:"http://www.facebook.com",tandc: "1")
user_six = User.create(name: "josh borin",email: "john@aol.com",description: "3",password: "Steph123",facebook:"http://www.facebook.com",tandc: "1")
user_seven = User.create(name: "Bob Dylan",email: "EnosMa@yahoo.com",description: "4",password: "BrianKnowsPW",facebook:"http://www.facebook.com",tandc: "1")
user_eight = User.create(name: "Roger rabbit",email: "lara@gmail.com",description: "5",password: "lauraspassword",facebook:"http://www.facebook.com",tandc: "1")

# Create the Rsvp Cap
puts "Creating RsvpCaps..."
one = RsvpCap.create(capacity: 1)
two = RsvpCap.create(capacity: 2)
three = RsvpCap.create(capacity: 3)
four = RsvpCap.create(capacity: 4)
five = RsvpCap.create(capacity: 5)

# Create the frequency
puts "Creating frequency..."
daily = Frequency.create(frequency: "daily")
weekly = Frequency.create(frequency: "weekly")
monthly = Frequency.create(frequency: "monthly")
quarterly = Frequency.create(frequency: "quarterly")

# Create the category
puts "Creating category..."
social = Category.create(name: "Social",logo: "fa fa-comments")
academic = Category.create(name: "Academic",logo: "fa fa-graduation-cap")
exercise = Category.create(name: "Exercise",logo: "fa fa-bolt")


# Create the events
puts "Creating events, Here we gooooo..."
event_one = Event.create(category_id: social.id,title: "Chat over coffee", description: "Lets meet to talk about Spring break plans and deals we've seen", date: "2015-11-11", time: "11:30am", location: "Starbucks in DT evanston",user_id: user_one.id)
event_two = Event.create(category_id: social.id,title: "Dance to some techno", description: "Meet me at SmartBar and we'll dance to some techno", date: "2015-4-4", time: "11:30pm", location: "SmartBar in Chicago",user_id: user_two.id)
event_three = Event.create(category_id: academic.id,title: "Lunch at Jake", description: "I'd like to meet some new students", date: "2015-5-4", time: "12:15pm", location: "Atrium at Jake",user_id: user_three.id)
event_four = Event.create(category_id: academic.id,title: "Finance 2 study session", description: "Come study with me to learn Finance 2. we can ask weach other questions", date: "2015-6-6", time: "5:30pm", location: "Jacobs G24",user_id: user_four.id)
event_five = Event.create(category_id: academic.id,title: "Startup discussions", description: "Lets talk about launching a startup at Kellogg", date: "2015-6-14", time: "6:30pm", location: "LSR", user_id: user_one.id)
event_six = Event.create(category_id: exercise.id,title: "Monday runs", description: "Run 2.5 miles along beach path. Meet at wholefoods", date: "2015-1-14", time: "6:30am", location: "Wholefoods", user_id: user_five.id)

# Create the reservations
puts "Creating Reservations, Blast off"
reservation_one = Reservation.create(event_id: event_four.id,user_id: user_three.id, comment: "Excited")
reservation_two = Reservation.create(event_id: event_one.id,user_id: user_one.id, comment: "stoked")
reservation_three = Reservation.create(event_id: event_two.id,user_id: user_two.id, comment: "where are we meeting")
reservation_four = Reservation.create(event_id: event_four.id,user_id: user_three.id, comment: "Im vegan")
reservation_five = Reservation.create(event_id: event_three.id,user_id: user_four.id, comment: "Party on")
reservation_six = Reservation.create(event_id: event_five.id,user_id: user_three.id, comment: "Ill bring beer")
reservation_seven = Reservation.create(event_id: event_six.id,user_id: user_two.id, comment: "Ill bring Corona")
reservation_eight = Reservation.create(event_id: event_three.id,user_id: user_one.id, comment: "Vodka")
reservation_nine = Reservation.create(event_id: event_five.id,user_id: user_two.id, comment: "Ill bring vegeplatter")
reservation_ten = Reservation.create(event_id: event_five.id,user_id: user_four.id, comment: "Havent bowled in 30 years")
reservation_eleven = Reservation.create(event_id: event_six.id,user_id: user_seven.id, comment: "get my dancing shows on")
reservation_twelve = Reservation.create(event_id: event_five.id,user_id: user_eight.id, comment: "Im pregnant")

puts "There are now #{User.count} Users and #{Event.count} Meetups in the database."
