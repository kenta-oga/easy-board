FactoryBot.define do
  factory :post do
    title { Faker::Team.name }
    content {Faker::Lorem.sentence}
    association :user
    association :group

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end