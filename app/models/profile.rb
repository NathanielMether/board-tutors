class Profile < ApplicationRecord
  include ProfileImageUploader[:profile_image]
  belongs_to :user
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :locations, presence: true

  def self.search(term)
    if term
      # Search through first_name, last_name, board_sport and locations attributes
      Profile.where(user: User.where('first_name ILIKE ?', "%#{term}%")) | Profile.where(user: User.where('last_name ILIKE ?', "%#{term}%")) | where('locations ILIKE ?', "%#{term}%") |where('board_sport ILIKE ?', "%#{term}%")
    else
      all
    end
  end
end
