FactoryBot.define do
  factory :user do
    name { '山田太郎' }
    email { Faker::Internet.free_email }
    password { 'test01' }
    password_confirmation { 'test01' }
  end
end
