FactoryBot.define do
  factory :user do
    nickname                {Faker::Name.initials(number: 2)}
    email                   {Faker::Internet.free_email}
    password                {'1a'+Faker::Internet.password(min_length: 6)}
    password_confirmation   {password}
    family_name             {"漢おオ"}
    first_name              {"漢おオ"}
    family_name_kana        {"カタカナ"}
    first_name_kana         {"カタカナ"}
    birthday                {"1991-11-11"}
  end
end