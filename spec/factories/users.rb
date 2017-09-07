require 'faker'

FactoryGirl.define do
  factory :user do |u|
    u.first_name { Faker::Name.first_name }
    u.email { Faker::Internet.email }
    password = Faker::Internet.password
    u.password password
    u.password_confirmation password
    u.role 0
  end
end
