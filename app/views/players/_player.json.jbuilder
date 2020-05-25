json.(player, :name, :birthdate, :nationality, :available, :created_at)

json.favorite do 
  json.value current_user.favorite_players.include?(player)
  json.remove_link remove_favorite_user_path(current_user.id, player.id)
  json.add_link add_favorite_user_path(current_user.id, player.id)
end
json.updated_at player.updated_at.in_time_zone('Paris')
json.updated_by_user

json.height do
    json.eu player.height_eu
    json.us player.height_us
end

json.weight do
    json.eu player.weight_eu
    json.us player.weight_us
end

json.salary do
    json.estimation player.salary_estimation
    json.real player.salary_real
end

json.agent do
    json.eu player.agent_fr
    json.us player.agent_us
end

json.profiles player.profiles do |profile|
  json.name profile.name
  json.link profile_path(profile.id)
end

json.status player.status.name

json.priority player.priority.name

json.position player.position, :short, :order

json.comments player.comments do |comment|
    json.content comment.content
    json.created_at comment.created_at
    json.created_by comment.created_by.name
end

json.seasons player.seasons, :name, :country, :team, :min, :points, :fgp, :three_fgp, :orb, :drb, :trb, :ast, :blk, :stl

json.link player_path(player)