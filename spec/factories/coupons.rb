FactoryBot.define do
  factory :coupon do
    member_id { 1 }
    is_valid { false }
    limit { 1 }
  end
end
