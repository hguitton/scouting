json.(player, :lastname, :firstname, :birthdate, :height_eu, :weight_eu, :height_us, :weight_us, :position, :status, :salary_estimation, :salary_real, :created_at, :updated_at)
json.updated_by "Hugo"
json.program ""
json.available true
json.profiles player.profiles, :name
json.comments player.comments, :content, :created_at, :created_by
json.seasons player.seasons, :name, :country, :team, :name, :team, :country, :min, :points, :fgp, :three_fgp, :orb, :drb, :trb, :ast, :blk, :stl