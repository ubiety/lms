require 'faker'

FactoryBot.define do
  factory :assignment do |a|
    a.name { Faker::StarWars.planet }
  end
end
