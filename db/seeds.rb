# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :username => 'nerdshark', :email => 'dork.fish.wat@gmail.com', :password => 'herpderp', :password_confirmation => 'herpderp', :role => Project::ROLES[0]
puts 'New user created: ' << user.name
user2 = User.create! :name => 'moduser', :email => 'moduser@example.com', :password => 'please', :password_confirmation => 'please', :role => Project::ROLES[1]
puts 'New user created: ' << user2.name
user2 = User.create! :name => 'reguser', :email => 'reguser@example.com', :password => 'please', :password_confirmation => 'please', :role => Project::ROLES[2]
puts 'New user created: ' << user2.nam
