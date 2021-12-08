FactoryBot.define do
  factory :user do
    name {"abcd"}
    email {Faker::Internet.free_email}
    password {"abc123"}
    password_confirmation {"abc123"}
  end
end