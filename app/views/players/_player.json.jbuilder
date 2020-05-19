json.(player, :name, :birthdate, :position, :status, :salary_estimation, :salary_real, :created_at, :updated_at)
json.height(player, :height_eu, :height_us)
json.weight(player, :weight_eu, :weight_us)
json.updated_by_user
json.program ""
json.available true
json.profiles player.profiles, :name
json.comments player.comments, :content, :created_at, :created_by
json.seasons player.seasons, :name, :country, :team, :name, :team, :country, :min, :points, :fgp, :three_fgp, :orb, :drb, :trb, :ast, :blk, :stl