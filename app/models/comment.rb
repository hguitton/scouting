class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :player
  validates :content, presence: true

  def created_by
    self.user
  end
end
