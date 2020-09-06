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

5.times do |x|
  Category.create!(
    name: "Category #{x + 1}"
  )
end


20.times do |x|
  Product.create!(
    name: "Product#{x}",
    description: "Some description",
    price: 100,
    user: User.where(id: [1..4]).sample , #ids from users from company 1
    company: User.first.company,
    category_id: (1..5).to_a.sample
  )
  Product.last.image.attach(io: File.open('./spec/fixtures/files/image.jpg'), filename: 'image.jpg')
  p Product.last.name
end

10.times do |x|
  Product.create!(
    name: "Product#{x}",
    description: "Some description",
    price: 100,
    user: User.where(id: [5..6]).sample , #ids from users from company 2
    company: User.last.company,
    category_id: (1..5).to_a.sample
  )
  Product.last.image.attach(io: File.open('./spec/fixtures/files/image.jpg'), filename: 'image.jpg')
  p Product.last.name
end

# comments

2.times do |x|
  Comment.create!(
    commentable: Product.first,
    user: User.first,
    body: "Comentario #{x}"
  )
end

2.times do |x|
  Comment.create!(
    commentable: Product.first,
    user: User.second,
    body: "Comentario #{x}"
  )
end

2.times do |x|
  Comment.create!(
    commentable: Comment.first,
    user: User.second,
    body: "Comentario #{x}"
  )
end

2.times do |x|
  Comment.create!(
    commentable: Comment.find(4),
    user: User.first,
    body: "Comentario #{x}"
  )
end

# order
Order.create!(
  product: Product.first,
  buyer: User.second,
  seller: User.first
)

Order.create!(
  product: Product.second,
  buyer: User.first,
  seller: User.second
)

#
# message
3.times do |x|
  Message.create!(
    text: "Mensagem #{x}",
    user: User.second,
    order: Order.first
  )
end

3.times do |x|
  Message.create!(
    text: "Mensagem #{x}",
    user: User.first,
    order: Order.second
  )
end

#
#

p 'done'
