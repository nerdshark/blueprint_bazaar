# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :_id => 'nerdshark', :email => 'dork.fish.wat@gmail.com', :password => 'herpderp', :password_confirmation => 'herpderp'
puts 'New user created: ' << user._id
user2 = User.create! :_id => 'moduser', :email => 'moduser@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user2._id
user2 = User.create! :_id => 'reguser', :email => 'reguser@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user2._id