require 'factory_girl'
require 'faker'

FactoryGirl.define do
  factory :project do |p|
    p.title {Faker::Lorem.characters 50}
    p.description {Faker::Lorem.paragraph}
    p.creator {Faker::Internet.user_name}
  end

  factory :step do |s|
    s.title {Faker::Lorem.characters 50}
    s.body {Faker::Lorem.paragraph}
  end
end