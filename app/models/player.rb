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
  

  scope :with_height_between, -> (min, max) { where(height_eu: min..max) }
  scope :with_weight_between, -> (min, max) { where(weight_eu: min..max) }
  scope :with_position, -> (position_ids) { where(position_id: position_ids) }
  scope :with_status, -> (status_ids) { where(status_id: status_ids) }
  
  # def self.with_age_between(min, max)
  #   min = min.years.ago.strftime("%d-%m-%Y")
  #   max = max.years.ago.strftime("%d-%m-%Y")
  #   where(birthdate: min..max)
  # end

  # def self.with_salary_between(min, max)

  # end
end