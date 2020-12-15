FactoryBot.define do
  factory :user do
    name { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { 'abc123' }
    password_confirmation { password }
  end
end
