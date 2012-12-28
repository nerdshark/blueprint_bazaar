require 'spec_helper'

FactoryGirl.define do
  factory :project do |p|
    p.title {Faker::Lorem.characters 50}
    p.description {Faker::Lorem.paragraph}
    p.creator {FactoryGirl.create(:user)}
  end

  factory :step do |s|
    s.title {Faker::Lorem.characters 50}
    s.body {Faker::Lorem.paragraph}
  end
end