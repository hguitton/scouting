class PlayerDecorator < Draper::Decorator
  delegate_all

  def last_update
    if object.comments.empty?
      build_last_update(player.updated_at, player.user)
    else
      lu_comments = object.comments.last.updated_at 
      lu_player = object.updated_at 
      return build_last_update(player.updated_at, player.user) if lu_player > lu_comments

      comment = player.comments.last
      build_last_update(comment.updated_at, comment.user)
    end
  end

  def build_last_update(date, user)
    h.tag.div do
      h.concat(h.tag.div "#{h.time_ago_in_words(date)} ago")
      h.concat(h.tag.small "by #{user.name}") if user
    end
  end

  def name
    object.name
  end

  def age
    ((Date.today - Date.parse(object.birthdate))/365.25).floor  
  end

  def height
    h.tag.div do
      h.concat(h.tag.div do 
        object.height_eu.to_s + "cm"
      end)
      h.concat(h.tag.small " #{object.height_us}") if object.height_us
    end
  end

  def weight
    h.tag.div do
      h.concat(h.tag.div object.weight_eu.to_s + "kg")
      h.concat(h.tag.small " #{object.weight_us} lbs") if object.weight_us
    end
  end

  def profiles
    h.tag.div do
      object.profiles.each do |p|
        h.concat(h.tag.div p.name)
      end
    end
  end

  def salary
    if object.salary_real
      
    end
  end
end
