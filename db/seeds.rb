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
user_one = User.create(name: "John Billy",email: "John@aol.com",description: "1",password: "slipknow23",facebook:"http://www.facebook.com",tandc: "1")
user_two = User.create(name: "Alex Smart",email: "smartalex@gmail.com",description: "2",password: "AAlex123",facebook:"http://www.facebook.com",tandc: "1")
user_three = User.create(name: "Steph Graph",email: "Graphme@hotmail.com",description: "3",password: "Steph123",facebook:"http://www.facebook.com",tandc: "1")
user_four = User.create(name: "Brian Eno",email: "EnosMusic@yahoo.com",description: "4",password: "BrianKnowsPW",facebook:"http://www.facebook.com",tandc: "1")
user_five = User.create(name: "Laura bobbit",email: "laura@gmail.com",description: "5",password: "lauraspassword",facebook:"http://www.facebook.com",tandc: "1")

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
event_one = Event.create(category_id: social.id,title: "Chat over coffee", description: "Lets meet to talk about Spring break plans and deals we've seen", date: "2015-11-11", time: "11:30am", location: "Starbucks in DT evanston",creator: user_one.id,participant1: user_three.id,participant2: user_two.id,participant3: user_four.id,participant4: user_one.id,participant5: user_five.id)
event_two = Event.create(category_id: social.id,title: "Dance to some techno", description: "Meet me at SmartBar and we'll dance to some techno", date: "2015-3-3", time: "11:30pm", location: "SmartBar in Chicago",creator: user_two.id,participant1: user_three.id,participant2: user_two.id,participant3: user_four.id,participant4: user_one.id,participant5: user_five.id)
event_three = Event.create(category_id: academic.id,title: "Lunch at Jake", description: "I'd like to meet some new students", date: "2015-5-4", time: "12:15pm", location: "Atrium at Jake",creator: user_three.id,participant1: user_three.id,participant2: user_two.id,participant3: user_four.id,participant4: user_one.id,participant5: user_five.id)
event_four = Event.create(category_id: academic.id,title: "Finance 2 study session", description: "Come study with me to learn Finance 2. we can ask weach other questions", date: "2015-2-3", time: "5:30pm", location: "Jacobs G24",creator: user_four.id,participant1: user_three.id,participant2: user_two.id,participant3: user_four.id,participant4: user_one.id,participant5: user_five.id)
event_five = Event.create(category_id: academic.id,title: "Startup discussions", description: "Lets talk about launching a startup at Kellogg", date: "2015-3-14", time: "6:30pm", location: "LSR",creator: user_one.id,participant1: user_three.id,participant2: user_two.id,participant3: user_four.id,participant4: user_one.id,participant5: user_five.id)
event_six = Event.create(category_id: exercise.id,title: "Monday runs", description: "Run 2.5 miles along beach path. Meet at wholefoods", date: "2015-1-14", time: "6:30am", location: "Wholefoods",creator: user_five.id,participant1: user_three.id,participant2: user_two.id,participant3: user_four.id,participant4: user_one.id,participant5: user_five.id)



puts "There are now #{User.count} Users and #{Event.count} Meetups in the database."
