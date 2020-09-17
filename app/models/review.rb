class Review < ApplicationRecord
  belongs_to :member 
  belongs_to :clinic

  validates :score, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
end
