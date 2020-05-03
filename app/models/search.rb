class Search < ApplicationRecord

  def find_players
    Player.includes(:level, :status, :priority, :position, :profiles, :comments, :seasons)
          .with_height_between(min_height, max_height)
          .with_weight_between(min_weight, max_weight)
          .with_position(positions)
          .with_status(statuses)
          .with_age_between(min_age,max_age)
          .with_profiles(profiles.reject(&:blank?))
          #.with_salary
          #.with_available
          #.with_priority
  end
end
