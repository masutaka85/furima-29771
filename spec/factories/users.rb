FactoryBot.define do
  factory :user do
    nickname                {Faker::Name.intials(number: 2)}
    email                   {Faker::Internet.free_email}
    password                {Faker::Internet.password(min_length: 6)}
    password_confirmation   {password}
    family_name             {/\A[ぁ-んァ-ン一-龥]/}
    first_name              {/\A[ぁ-んァ-ン一-龥]/}
    family_name_kana        {/\A[ァ-ヶー－]+\z/}
    first_name_kana         {/\A[ァ-ヶー－]+\z/}
    birthday                {1991-11-11}
  end
end