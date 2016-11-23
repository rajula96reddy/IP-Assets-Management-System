FactoryGirl.define do
  factory :user do
    name "Test User"
    Research_Groups "1"
    email "test@example.com"
    password "please123"

    trait :admin do
      role 'admin'
    end

  end
end
