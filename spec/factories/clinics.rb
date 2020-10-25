
FactoryBot.define do

  factory :clinic do
    name { "test" }
    doctor { "test" }
    postcode { "1231111" }
    address { "大阪府大阪市test" }
    phone_number { "111111111" }
    is_active { "true" }
  end
  
end