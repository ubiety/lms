require 'faker'

FactoryGirl.define do
  factory :assignment do |a|
    a.name { Faker::StarWars.planet }
  end
end
