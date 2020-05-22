json.(player, :name, :birthdate, :nationality, :available, :created_at, :updated_at)

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

json.updated_by_user

json.profiles player.profiles, :name

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