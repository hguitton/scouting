class PlayerDecorator < Draper::Decorator
  include ActionView::Helpers::UrlHelper
  delegate_all

  def favorite_star
    if(h.current_user.favorite_players.include?(object))
      h.tag.span(class: "icon has-text-warning", data: { controller: 'favorite', 'favorite-url': Rails.application.routes.url_helpers.remove_favorite_user_path(h.current_user.id, object.id) }) do 
        h.concat(h.tag.i(class: 'fas fa-star', data: { action: 'click->favorite#unfav' }))
      end
    else
      h.tag.span(class: "icon", data: { controller: 'favorite', 'favorite-url': Rails.application.routes.url_helpers.add_favorite_user_path(h.current_user.id, object.id) }) do 
        h.concat(h.tag.i(class: 'far fa-star', data: { action: 'click->favorite#fav' }))
      end
    end
  end

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

  def profiles_tags
    h.tag.div do
      object.profiles.each do |p|
        h.concat(h.tag.div(class: "tag is-info m-xxs") do
          p.name
        end)
      end
    end
  end

  def salary
    return "#{object.salary_real}k€" unless object.salary_real.zero?
    object.salary_estimation
  end

  def agent
    return object.agent_fr if object.agent_fr.present?
    return object.agent_us if object.agent_us.present?
  end

  def last_season
    return if object.seasons.empty?
    last_season = object.seasons.order(name: :asc).last
    h.tag.div do
      h.concat(h.tag.small(class: "is-block"){ last_season.name })
      h.concat(h.tag.small(class: "is-block"){ last_season.country })
      h.concat(h.tag.div(class: "has-text-weight-semibold is-block"){ last_season.team })
    end
  end

  def comments_cell
    return if object.comments.empty?
    h.tag.div(data:{ controller: "modal"}) do 
      h.concat(h.tag.small "#{object.comments.size} comment(s)", data: { action: "click->modal#open"})
      h.concat(h.tag.div(class: "modal-window", data: { target: "modal.modalWindow", action: 'click->modal#close' }) do
        h.concat(h.tag.div(style: "display: block;") do 
          object.comments.order(created_at: :desc).each do |comment|
            h.concat(h.tag.div(class: 'm-b-xl') do 
              h.concat(h.tag.small "#{h.time_ago_in_words(comment.created_at)} ago")
              h.concat(h.tag.strong " - #{comment.user.name} : ") 
              h.concat(h.tag.p comment.content, class: 'p-l-md')
            end)
          end
        end)
      end)
    end
  end

  private
  def build_last_update(date, user)
    h.tag.div do
      h.concat(h.tag.div "#{h.time_ago_in_words(date)} ago")
      h.concat(h.tag.small "by #{user.name}") if user
    end
  end
end
