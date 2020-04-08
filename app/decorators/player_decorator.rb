class PlayerDecorator < Draper::Decorator
  delegate_all

  def last_update
    return build_last_update(player.updated_at, player.user) if object.comments.empty? || (object.updated_at > object.comments.last.updated_at)
    comment = player.comments.last
    build_last_update(comment.updated_at, comment.user)
  end

  def age
    ((Date.today - Date.parse(object.birthdate))/365.25).floor  
  end

  def height
    h.tag.div do
      h.concat(h.tag.div do 
        object.height_eu.to_s + "cm"
      end)
      h.concat(h.tag.small "#{object.height_us}") if object.height_us
    end
  end

  def weight
    h.tag.div do
      h.concat(h.tag.div object.weight_eu.to_s + "kg")
      h.concat(h.tag.small "#{object.weight_us}lbs") if object.weight_us
    end
  end

  def profiles
    h.tag.div do
      object.profiles.each do |p|
        h.concat(h.tag.div(class: "tag is-primary m-xxs") do
          p.name
        end)
      end
    end
  end

  def salary
    return object.salary_real + 'k€' if object.salary_real.present?
    object.salary_estimation
  end

  def agent
    return object.agent_fr if object.agent_fr.present?
    return object.agent_us if object.agent_us.present?
  end

  def last_season
    return if object.seasons.empty?
    last_season = object.seasons.last
    h.tag.div do
      h.concat(h.tag.small(class: "is-block"){ last_season.name })
      h.concat(h.tag.small(class: "is-block"){  last_season.country })
      h.concat(h.tag.div(class: "is-block"){ last_season.team })
    end
  end

  def comments
    return if object.comments.empty?
    h.tag.small "#{object.comments.count} comment(s)"
  end

  def available
    object.available ? "Dispo." : "Sous contrat"
  end

  private
  def build_last_update(date, user)
    h.tag.div do
      h.concat(h.tag.div "#{h.time_ago_in_words(date)} ago")
      h.concat(h.tag.small "by #{user.name}") if user
    end
  end
end
