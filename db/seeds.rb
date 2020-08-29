p 'seeding'

User.create!(
  name: Faker::Name.first_name,
  surname: Faker::Name.last_name,
  department: Faker::Lorem.word,
  email: 'test@company.com',
  password: 'password'
)

3.times do |x|
  User.create!(
    name: Faker::Name.first_name,
    surname: Faker::Name.last_name,
    department: Faker::Lorem.word,
    email: "test#{x}@company.com",
    password: 'password'
  )
  p User.last.name
end

2.times do |x|
  User.create!(
    name: Faker::Name.first_name,
    surname: Faker::Name.last_name,
    department: Faker::Lorem.word,
    email: "test#{x}@othercompany.com",
    password: 'password'
  )
  p User.last.name
end

20.times do |x|
  Product.create!(
    name: "Product#{x}",
    description: "Some description",
    user: User.where(id: [1..4]).sample , #ids from users from company 1
    company: User.first.company
  )
  Product.last.image.attach(io: File.open('./spec/fixtures/files/image.jpg'), filename: 'image.jpg')
  p Product.last.name
end

10.times do |x|
  Product.create!(
    name: "Product#{x}",
    description: "Some description",
    user: User.where(id: [5..6]).sample , #ids from users from company 2
    company: User.last.company
  )
  Product.last.image.attach(io: File.open('./spec/fixtures/files/image.jpg'), filename: 'image.jpg')
  p Product.last.name
end

p 'done'
