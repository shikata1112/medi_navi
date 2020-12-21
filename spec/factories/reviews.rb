FactoryBot.define do

  factory :review do
    member_id { }
    clinic_id { }
    title { 'aaaaa' }
    comment { 'iiiiiii' }
    wating_time { 0 }
    score { 3 }
  end
end