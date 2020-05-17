class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  has_and_belongs_to_many :favorite_players, class_name: "Player", join_table: "players_users"

  if ENV['SIGNUP_ALLOWED'] == 'true'
    devise :registerable
  end
end
