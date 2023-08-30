FactoryBot.define do
  factory :comment do
    content { Faker::Commerce.department }
    association :user
    association :app
  end
end
