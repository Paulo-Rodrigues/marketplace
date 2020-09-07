FactoryBot.define do
  factory :category do 
    name { "Categoria A" }

    factory :categories do
      name {"Categoria #{SecureRandom.alphanumeric(5)}"}
    end
  end
end
