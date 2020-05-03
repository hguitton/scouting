class Search < ApplicationRecord
  before_save :set_defaults

  def find_players
    Player.includes(:level, :status, :priority, :position, :profiles, :comments, :seasons)
          .with_height_between(min_height, max_height)
          .with_weight_between(min_weight, max_weight)
          .with_position(positions)
          .with_status(statuses)
          .with_age_between(min_age,max_age)
          .with_profiles(profiles.reject(&:blank?))
          .with_salary_between(min_salary, max_salary)
          .with_available(available)
          #.with_priority
  end

  def set_defaults
    self.min_height = 0 if self.min_height.nil?
    self.max_height = 240 if self.max_height.nil?
    self.min_weight = 0 if self.min_weight.nil?
    self.max_weight = 160 if self.max_weight.nil?
    self.min_salary = 0 if self.min_salary.nil?
    self.max_salary = 500 if self.max_salary.nil?
    self.min_age = 0 if self.min_age.nil?
    self.max_age = 45 if self.max_age.nil?
  end
end
