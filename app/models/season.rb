class Season < ApplicationRecord
  belongs_to :player
  
  validates :team, :country, presence: true
end
