FactoryBot.define do
  factory :notification1, class: Notification do
    visiter_id { nil }
    visited_id { nil }
    room_id { 1 }
    message_id { 1 }
    action { "dm" }
    checked { false }
  end

  factory :notification2, class: Notification do
    visiter_id { nil }
    visited_id { nil }
    room_id { 1 }
    message_id { 1 }
    action { "dm" }
    checked { false }
  end
end
