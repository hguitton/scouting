# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create(email: "guitton.h@gmail.com", password: "123456")

["NBA", "Euroleague", "Europe 2", "Jeep Elite", "Back up", "Prospect NBA", "Prospect Euro", "Prospect JE", "Vétéran", "Rookie"].each do |level|
  Level.create(name: level)
end

["Complet", "Scoreur", "Passeur", "Rebondeur", "Créateur", "Stopeur", "Fort Shooteur", "Driver"].each do |profile|
  Profile.create(name: profile)
end

["Priorité", "Short list", "A suivre", "Trop cher", "No way"].each do |priority|
  Priority.create(name: priority)
end

Position.create(name: "Point Guard", short: "PG", order: 1)
Position.create(name: "Guard", short: "G", order: 2)
Position.create(name: "Shooting Guard", short: "SG", order: 3)
Position.create(name: "Combo Guard", short: "SG", order: 4)
Position.create(name: "Small Forward", short: "SF", order: 5)
Position.create(name: "Forward", short: "F", order: 6)
Position.create(name: "Power Forward", short: "PF", order: 7)
Position.create(name: "Stretch 4", short: "Str 4", order: 8)
Position.create(name: "Versatile Big man", short: "Big", order: 9)
Position.create(name: "Stretch 5", short: "Str 5", order: 10)
Position.create(name: "Center", short: "C", order: 11)

Status.create(name: "JNFL", short: "JNFL")
Status.create(name: "Bosman", short: "BOS")
Status.create(name: "Cotonou", short: "COT")
Status.create(name: "JFL", short: "JFL")