class Player < ApplicationRecord
  belongs_to :level
  belongs_to :status
  belongs_to :priority
  belongs_to :position
  has_and_belongs_to_many :profiles
  has_many :seasons
  accepts_nested_attributes_for :seasons, allow_destroy: true, reject_if: proc { |att| att[:team].blank? }
  has_many :socials
  accepts_nested_attributes_for :socials, allow_destroy: true, reject_if: proc { |att| att[:link].blank? }
  has_many :comments
  accepts_nested_attributes_for :comments, allow_destroy: true, reject_if: proc { |att| att[:content].blank? }


  belongs_to :user, foreign_key: "updated_by_user_id"
  validates :name, :nationality, presence: true
  
end
