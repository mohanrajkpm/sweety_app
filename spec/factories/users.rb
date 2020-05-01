FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "#{('a'..'z').to_a.shuffle.join}#{n}"}
    email { "#{name}@gmail.com"}
    password {"12345678"}
    association :role_id, factory: :role
  end
end
