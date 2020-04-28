class Season < ApplicationRecord
  belongs_to :player
  
  validates :team, presence: true
end
