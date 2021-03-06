class Roster < ApplicationRecord
  include ActionView::Helpers
  has_and_belongs_to_many :players
  belongs_to :user
  has_many :roster_spots
  validates :name, presence: true

  def total_minutes
    roster_spots.sum{|rs| rs.minutes.to_i }
  end

  def total_price
    number_with_delimiter(roster_spots.sum{|rs| rs.price.delete(' ').to_i }, delimiter: " ")
  end

  def available_players
    return players if roster_spots.empty?
    return [] if players.count.zero?
    players - roster_spots.includes(:players).sum(&:players)
  end
end
