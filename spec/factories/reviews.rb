FactoryBot.define do

  factory :review do
    member_id { }
    clinic_id { }
    title { 'aaaaa' }
    comment { 'iiiiiii' }
    wating_time { 0 }
    score { 3 }
  end

  factory :review2, class: Review do
    member_id { }
    clinic_id { }
    title { 'test' }
    comment { 'あいうえお' }
    wating_time { 0 }
    score { 1 }
  end
end