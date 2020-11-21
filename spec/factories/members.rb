
FactoryBot.define do

  factory :member do
    name { 'test' }
    email { 'test@example.com' }
    postcode { '1231111' }
    address { '大阪府大阪市test' }
    birthday { '1999-11-11' }
    sex { true }
    prefecture_code { 27 }
    is_deleted { false }
    password { '111111' }
    password_confirmation { '111111' }
  end

  factory :admin do
    email { 'admin@example.com' }
    password { '12345678' }
  end

  factory :guest, class: Member do
    id { 2 }
    name { 'ゲスト' }
    email { 'guest@example.com' }
    postcode { '1111111' }
    address { '東京都台東区123' }
    birthday { '1990-05-05' }
    sex { true }
    prefecture_code { 12 }
    is_deleted { false }
    password { '123456' }
    password_confirmation { '123456' }
  end
  
end