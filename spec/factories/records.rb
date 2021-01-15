FactoryBot.define do
  factory :record do
    association :user
    association :item
  end
end
