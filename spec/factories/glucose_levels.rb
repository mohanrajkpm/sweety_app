FactoryBot.define do
  factory :glucose_level do
    glucose { 100 }
    created_at {"2020-04-12"}
    association :user_id, factory: :user 
  end
end