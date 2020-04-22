class Status < ApplicationRecord
  has_many :players
  validates :name, presence: true
  default_scope { where(:active => true) }
end
