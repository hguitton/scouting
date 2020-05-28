class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_save :set_name
  has_and_belongs_to_many :favorite_players, class_name: "Player", join_table: "players_users"
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  if ENV['SIGNUP_ALLOWED'] == 'true'
    devise :registerable
  end

  def set_name
    self.name = ""
  end
end
