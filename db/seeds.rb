# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

## Seed Teams
teams_data = [
  { name: "McLaren", location: "Royaume-Uni" },
  { name: "Ferrari", location: "Italie" },
  { name: "Red Bull Racing", location: "Autriche" },
  { name: "Mercedes", location: "Allemagne" },
  { name: "Aston Martin", location: "Royaume-Uni" },
  { name: "Alpine", location: "France" },
  { name: "Haas", location: "États-Unis" },
  { name: "Racing Bulls", location: "Italie" },
  { name: "Williams", location: "Royaume-Uni" },
  { name: "Kick Sauber", location: "Suisse" }
]

teams_data.each do |team_attrs|
  team = Team.find_or_initialize_by(name: team_attrs[:name])
  if team.new_record?
    team.location = team_attrs[:location]
    team.save!
    puts "Team #{team.name} créée."
  else
    puts "Team #{team.name} déjà existante."
  end
end

## Seed Drivers
teams = Team.all.index_by(&:name)

drivers_data = [
  { first_name: "Max", last_name: "Verstappen", nationality: "Néerlandais", number: 1, team_name: "Red Bull Racing" },
  { first_name: "Yuki", last_name: "Tsunoda", nationality: "Japonais", number: 22, team_name: "Red Bull Racing" },
  { first_name: "Kimi", last_name: "Antonelli", nationality: "Italien", number: 12, team_name: "Mercedes" },
  { first_name: "George", last_name: "Russell", nationality: "Britannique", number: 63, team_name: "Mercedes" },
  { first_name: "Charles", last_name: "Leclerc", nationality: "Monégasque", number: 16, team_name: "Ferrari" },
  { first_name: "Lewis", last_name: "Hamilton", nationality: "Britannique", number: 44, team_name: "Ferrari" },
  { first_name: "Lando", last_name: "Norris", nationality: "Britannique", number: 4, team_name: "McLaren" },
  { first_name: "Oscar", last_name: "Piastri", nationality: "Australien", number: 81, team_name: "McLaren" },
  { first_name: "Fernando", last_name: "Alonso", nationality: "Espagnol", number: 14, team_name: "Aston Martin" },
  { first_name: "Lance", last_name: "Stroll", nationality: "Canadien", number: 18, team_name: "Aston Martin" },
  { first_name: "Franco", last_name: "Colapinto", nationality: "Argentin", number: 43, team_name: "Alpine" },
  { first_name: "Pierre", last_name: "Gasly", nationality: "Français", number: 10, team_name: "Alpine" },
  { first_name: "Esteban", last_name: "Ocon", nationality: "Français", number: 31, team_name: "Haas" },
  { first_name: "Oliver", last_name: "Bearman", nationality: "Britannique", number: 87, team_name: "Haas" },
  { first_name: "Nico", last_name: "Hulkenberg", nationality: "Allemand", number: 27, team_name: "Kick Sauber" },
  { first_name: "Gabriel", last_name: "Bortoleto", nationality: "Brésilien", number: 5, team_name: "Kick Sauber" },
  { first_name: "Alexander", last_name: "Albon", nationality: "Thaïlandais", number: 23, team_name: "Williams" },
  { first_name: "Carlos", last_name: "Sainz", nationality: "Espagnol", number: 55, team_name: "Williams" },
  { first_name: "Liam", last_name: "Lawson", nationality: "Néo-zélandais", number: 30, team_name: "Racing Bulls" },
  { first_name: "Isack", last_name: "Hadjar", nationality: "Français", number: 6, team_name: "Racing Bulls" }
]

drivers_data.each do |driver_attrs|
  driver = Driver.find_or_initialize_by(first_name: driver_attrs[:first_name], last_name: driver_attrs[:last_name])

  if driver.new_record?
    driver.nationality = driver_attrs[:nationality]
    driver.number = driver_attrs[:number]
    driver.team = teams[driver_attrs[:team_name]]
    driver.save!
    puts "Pilote #{driver.first_name} #{driver.last_name} créé."
  else
    puts "Pilote #{driver.first_name} #{driver.last_name} déjà existant."
  end
end
