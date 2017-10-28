require 'faker'

FactoryBot.define do
  factory :user do |u|
    u.first_name 'John'
    u.email { Faker::Internet.email }
    password = Faker::Internet.password
    u.password password
    u.password_confirmation password
    u.role 0
  end
end
