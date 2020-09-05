FactoryBot.define do
  factory :product do
    name { "Product" }
    description { "Product description" }
    user 
    status {'available'}
    price {100.00}
    company {user.company}
    image {Rack::Test::UploadedFile.new('spec/fixtures/files/image.jpg', 'image/jpg')}
  end
end
