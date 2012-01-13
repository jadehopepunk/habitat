require 'machinist/active_record'
require 'ffaker'

User.blueprint do
  name               { Faker::Name.name }
  email              { Faker::Internet.email }
  password           { "password" }
end

User.blueprint(:admin) do
  role { 'admin' }
end

Project.blueprint do
  name                  { 'Some Project' }
  address               { 'New York, New York' }
  project_category_name { "Suburban Yard" }
  user                  { User.make }
end