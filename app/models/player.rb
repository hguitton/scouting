class Player < ApplicationRecord
  has_and_belongs_to_many :profiles
  has_many :comments
  has_many :seasons
  has_many :socials
  belongs_to :level
end
