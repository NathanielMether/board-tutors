class User < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    attribute :first_name, :last_name
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
