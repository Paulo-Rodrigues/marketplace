FactoryBot.define do
  factory :product do
    name { "Product" }
    description { "Product description" }
    user 
    company {user.company}
    image {Rack::Test::UploadedFile.new('spec/fixtures/files/image.jpg', 'image/jpg')}
  end
end
