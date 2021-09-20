FactoryBot.define do
  factory :user do
    nickname              { 'tarou' }
    email                 { 'sample@gmail.com' }
    password              { '123456a' }
    encrypted_password    { '123456a' }
    family_name           { '山田' }
    first_name            { '太郎' }
    family_name_kana      { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birth_day             { '2000-01-01' }
  end
end
