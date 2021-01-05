FactoryBot.define do
  factory :user do
    nickname                {Faker::Name.initials}
    email                   {Faker::Internet.free_email}
    password                {"test00"}
    password_confirmation   {"test00"}
    last_name               {"テスト"}
    first_name              {"テスト"}
    last_name_kana          {"テスト"}
    first_name_kana         {"テスト"}
    birth_date              {"1999-9-9"}
  end
end