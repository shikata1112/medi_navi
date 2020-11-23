
FactoryBot.define do

  factory :clinic do
    name { "testクリニック" }
    doctor { "test太郎" }
    postcode { "1231111" }
    address { "大阪府大阪市中央区test" }
    phone_number { "111111111" }
    is_active { true }
  end
  
end