class Event < ApplicationRecord
  belongs_to :member, optional: true
end
