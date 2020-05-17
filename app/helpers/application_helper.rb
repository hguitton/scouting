module ApplicationHelper
  def list_seasons
    d = DateTime.now
    array = []
    current = d.month.between?(6,12) ? [d.year, d.year+1] : [d.year-1, d.year]
    array << current
    6.times do
      array << [array.last[0]-1, array.last[1]-1]
    end
    array.map{|e| "#{e[0]} - #{e[1]}"}
  end

  def countries_list
    YAML.load_file("#{Rails.root.to_s}/config/data/countries.yml")["countries"]
  end

  def users_list
    User.where.not(id: 1).where.not(id: current_user.id)
  end
end
