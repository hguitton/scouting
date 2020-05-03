namespace :salaries do
  desc "Update salaries"
  task update_salaries: :environment do
    Player.all.each do |player|
      case player.salary_estimation
      when "50k€ - 100k€"
        player.update(salary_estimation: "50k€ - 99k€")
      when "100k€ - 150k€"
        player.update(salary_estimation: "100k€ - 149k€")
      when "150k€ - 200k€"
        player.update(salary_estimation: "150k€ - 199k€")
      when "200k€ - 250k€"
        player.update(salary_estimation: "200k€ - 249k€")
      end
    end
  end
end
