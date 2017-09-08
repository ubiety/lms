require 'faker'

FactoryGirl.define do
  factory :course do |c|
    c.name { Faker::StarWars.planet }
  end
end
