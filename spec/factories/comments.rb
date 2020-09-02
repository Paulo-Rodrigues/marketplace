FactoryBot.define do
  factory :comment do
    body { "My Comment" }
    user
    commentable 
  end
end
