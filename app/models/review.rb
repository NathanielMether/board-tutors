class Review < ApplicationRecord
  belongs_to :user
  belongs_to :profile

  validates :rating, numericality: { greater_than: 0, less_than_or_equal_to: 5 }
end
