
FactoryBot.define do

  factory :clinic do
    name { "testクリニック" }
    doctor { "test太郎" }
    postcode { "1231111" }
    address { "大阪府大阪市中央区test" }
    phone_number { "111111111" }
    is_active { true }
  end

  factory :clinic1, class: Clinic do
    name { "大阪クリニック" }
    nearest_station { "京橋駅" }
    phone_number { "0776669999" }
    address { "大阪府大阪市中央区123" }
    doctor{ "やまだ" }
    postcode { "1111111" }
    is_active { true }
  end

  factory :clinic2, class: Clinic do
    name { "東京クリニック" }
    nearest_station { "西京橋駅" }
    phone_number { "1122556755" }
    address { "東京都千代田区丸の内123" }
    doctor { "たなか" }
    postcode { "1111111" }
    is_active { true }
  end

  factory :clinic3, class: Clinic do
    name { "福岡医院" }
    nearest_station { "博多駅" }
    phone_number { "1234555567" }
    address { "福岡県福岡市中央区博多123" }
    doctor { "ふくおか" }
    postcode { "1111111" }
    is_active { true }
  end

  factory :clinic4, class: Clinic do
    name { "しかた整形外科クリニック" }
    nearest_station { "西中島南方駅" }
    phone_number { "1111234" }
    address { "大阪府大阪市淀川区西中島3丁目" }
    doctor { "しかた" }
    postcode { "5320011" }
    is_active { true }
  end
  
end