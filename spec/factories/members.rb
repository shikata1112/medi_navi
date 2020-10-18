FactoryBot.define do

  factory :member do
    name { "test" }
    email { "test@gmail.com" }
    postcode { "1111111" }
    address { "大阪府大阪市test" }
    birthday { "1999-11-11" }
    sex { "true" }
    prefecture_code { "27" }
    is_deleted { "true" }
    password { "111111" }
    password_confirmation { "111111" }
  end
  
end