class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :player

  def created_by
    "Hugo"
  end
end
