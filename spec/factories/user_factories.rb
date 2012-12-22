require 'spec_helper'

FactoryGirl.define do
  sequence :_id do |n|"user-#{n}" end
  sequence :email do |n| "user-#{n}@example.com" end
  factory :user do |u|
    _id
    email
    u.password "please"
    u.password_confirmation "please"
  end
end