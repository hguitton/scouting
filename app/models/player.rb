class Player < ApplicationRecord
  after_save :add_birthdate_timestamp
  
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
  
  def self.with_age_between(min, max)
    where(birthdate_timestamp: max.years.ago..min.years.ago)
  end

  def self.with_salary_between(min, max)
    start_index = end_index = nil
    Settings.players.salaries.each_with_index do |salary, index|
      start_index = index if (salary.min..salary.max).include? min
      end_index = index if (salary.min..salary.max).include? max
    end
    salaries_requested = Settings.players.salaries[start_index..end_index].map(&:name)
    puts salaries_requested.inspect.red
  end

  def self.with_profiles(profile_ids)
    joins_list = []
    where = ""

    profile_ids.each_with_index do |profile, index|
      pp = "pp#{index + 1}"
      joins_list << "INNER JOIN players_profiles AS " + pp + " ON " + pp + ".player_id = players.id"
      where += ' AND ' if index > 0
      where +=  pp + ".profile_id =" + profile.to_s
    end
    
    # Player.joins('INNER JOIN players_profiles AS pp1 ON pp1.player_id = players.id')
    #       .joins('INNER JOIN players_profiles AS pp2 ON pp2.player_id = players.id')
    #       .where(pp1: { profile_id: 9 }).where(pp2: { profile_id: 3 })
    joins(joins_list).where(where)
  end


  def add_birthdate_timestamp
    begin
      bd = Date.parse(self.birthdate)
      self.update_column(:birthdate_timestamp, bd)
    rescue ArgumentError
      puts "Invalid Date"
    end
  end
end
