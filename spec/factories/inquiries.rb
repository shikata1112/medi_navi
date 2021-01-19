FactoryBot.define do
  factory :inquiry do
    title { 'test' }
    content { 'これはtestです。' }
    member_id {}
  end
end
