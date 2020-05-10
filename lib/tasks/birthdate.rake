namespace :birthdate do
  desc "Add timestamp birthdate"
  task add_timestamp: :environment do
    Player.all.each do |player|
      begin
        bd = Date.parse(player.birthdate)
        player.update(birthdate_timestamp: bd)
      rescue ArgumentError
        puts "Invalid Date"
      end
    end
  end
end
