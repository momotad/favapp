FactoryBot.define do
  factory :app do
    name { Faker::Commerce.product_name }
    content { Faker::Commerce.department }
    genre_id { Faker::Number.between(from: 2, to: 20) }
    association :user

    after(:build) do |app|
      app.image.attach(io: File.open('public/image/sample.jpg'), filename: 'sample.jpg')
    end
  end
end
