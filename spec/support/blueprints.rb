require 'machinist/active_record'
require 'ffaker'

User.blueprint do
  name               { Faker::Name.name }
  email              { Faker::Internet.email }
  password           { "password" }
end
