FactoryBot.define do

  factory :entry1, :class => Entry do
    room_id { 1 }
    member_id { 1 }
  end

  factory :entry2, :class => Entry do
    room_id { 1 }
    member_id { 2 }
  end
end
