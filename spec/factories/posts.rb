FactoryBot.define do
  factory :post do
    content {"abcdefg"}
    association :user
    association :room

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end