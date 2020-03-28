# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "guitton.h@gmail.com", password: "123456")

prof1 = Profile.create(name: "Rim protector")
prof2 = Profile.create(name: "Slasher")
prof3 = Profile.create(name: "Defense")
prof4 = Profile.create(name: "Playmaking")
prof5 = Profile.create(name: "3&D")

player1 = Player.create(
  lastname: "MBODJ",
  firstname: "Cheikh",
  birthdate: "01/08/1987",
  status: "Bosman/Cotonou",
  nationality: "Senegal",
  agent_fr: "Agent FR",
  agent_us: "",
  position: "5",
  height_us: "6'10\"",
  height_eu: "208",
  weight_us: "235",
  weight_eu: "100",
  salary: "100k - 150k",
  available: true
)

player1.profiles << prof1
player1.profiles << prof4

Season.create(player: player1, user_id: User.first.id, name: "19-20", team: "Pau-Lacq-Orthez", country: "French Jeep Elite", min: "18,6", points: "8,2", trb: "4,2")
Season.create(player: player1, user_id: User.first.id, name: "18-19", team: "Twarde Pierniki Torun", country: "Polish TBL", min: "21,6", points: "10,5", trb: "5,3")
comment = Comment.create(player: player1, user: User.first, content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac ultricies nulla. Vivamus sed aliquet est, non condimentum dui. Sed condimentum vel magna in suscipit. Phasellus eu nibh et augue ullamcorper pharetra. Proin elementum nulla et egestas rhoncus. Curabitur eu vulputate sem, at aliquam erat. Proin ac ante at enim rhoncus aliquam id quis libero. In scelerisque tortor vel cursus pretium. Proin iaculis enim ac libero aliquet lacinia.")

player2 = Player.create(
  lastname: "CHERY",
  firstname: "Kenny",
  birthdate: "24/01/1992",
  status: "Import",
  nationality: "Canada",
  agent_fr: "Agent FR",
  agent_us: "Agent US",
  position: "1",
  height_us: "",
  height_eu: "180",
  weight_us: "180",
  weight_eu: "80",
  salary: "150k - 200k",
  available: false
)

player2.profiles << prof3
player2.profiles << prof4