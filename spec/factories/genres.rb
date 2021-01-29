FactoryBot.define do

  factory :genre do
    medical_department { "内科" }
  end

  factory :genre2, class: Genre do
    medical_department { "眼科" }
  end
  
end