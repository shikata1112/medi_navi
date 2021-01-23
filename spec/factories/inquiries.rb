FactoryBot.define do
  factory :inquiry do
    title { 'test' }
    content { 'これはtestです。' }
    member_id { 1 }
  end
end
