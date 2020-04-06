class Player < ApplicationRecord
  belongs_to :level
  has_and_belongs_to_many :profiles
  has_many :seasons
  accepts_nested_attributes_for :seasons
  has_many :socials
  accepts_nested_attributes_for :socials
  has_many :comments
  accepts_nested_attributes_for :comments

  belongs_to :user, foreign_key: "updated_by_user_id"
  validates :name, :status, :nationality, presence: true
  
end
