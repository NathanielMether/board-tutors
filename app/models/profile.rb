class Profile < ApplicationRecord
  include ProfileImageUploader[:profile_image]
  include AlgoliaSearch

  algoliasearch do
    attribute :location
  end

  belongs_to :user
end
