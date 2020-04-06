class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :player

  def created_by
    self.user
  end
end
