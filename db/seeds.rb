# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

## --- RESET ---
Result.destroy_all
RaceEdition.destroy_all
Race.destroy_all
Driver.destroy_all
Team.destroy_all


puts "Database cleaned."

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

puts "Creating teams..."

teams_data.each do |team_attrs|
  Team.create!(team_attrs)
  puts "Team #{team_attrs[:name]} created."
end

## Seed Drivers
teams = Team.all.index_by(&:name)

drivers_data = [
  { first_name: "Max", last_name: "Verstappen", nationality: "Néerlandais", number: 1, team_name: "Red Bull Racing", points: 366 },
  { first_name: "Yuki", last_name: "Tsunoda", nationality: "Japonais", number: 22, team_name: "Red Bull Racing", points: 28 },
  { first_name: "Kimi", last_name: "Antonelli", nationality: "Italien", number: 12, team_name: "Mercedes", points: 137 },
  { first_name: "George", last_name: "Russell", nationality: "Britannique", number: 63, team_name: "Mercedes", points: 294 },
  { first_name: "Charles", last_name: "Leclerc", nationality: "Monégasque", number: 16, team_name: "Ferrari", points: 226 },
  { first_name: "Lewis", last_name: "Hamilton", nationality: "Britannique", number: 44, team_name: "Ferrari", points: 152 },
  { first_name: "Lando", last_name: "Norris", nationality: "Britannique", number: 4, team_name: "McLaren", points: 390 },
  { first_name: "Oscar", last_name: "Piastri", nationality: "Australien", number: 81, team_name: "McLaren", points: 366 },
  { first_name: "Fernando", last_name: "Alonso", nationality: "Espagnol", number: 14, team_name: "Aston Martin", points: 40 },
  { first_name: "Lance", last_name: "Stroll", nationality: "Canadien", number: 18, team_name: "Aston Martin", points: 32 },
  { first_name: "Franco", last_name: "Colapinto", nationality: "Argentin", number: 43, team_name: "Alpine", points: 0 },
  { first_name: "Pierre", last_name: "Gasly", nationality: "Français", number: 10, team_name: "Alpine", points: 22 },
  { first_name: "Esteban", last_name: "Ocon", nationality: "Français", number: 31, team_name: "Haas", points: 32 },
  { first_name: "Oliver", last_name: "Bearman", nationality: "Britannique", number: 87, team_name: "Haas", points: 41 },
  { first_name: "Nico", last_name: "Hulkenberg", nationality: "Allemand", number: 27, team_name: "Kick Sauber", points: 49 },
  { first_name: "Gabriel", last_name: "Bortoleto", nationality: "Brésilien", number: 5, team_name: "Kick Sauber", points: 19 },
  { first_name: "Alexander", last_name: "Albon", nationality: "Thaïlandais", number: 23, team_name: "Williams", points: 73 },
  { first_name: "Carlos", last_name: "Sainz", nationality: "Espagnol", number: 55, team_name: "Williams", points: 48 },
  { first_name: "Liam", last_name: "Lawson", nationality: "Néo-zélandais", number: 30, team_name: "Racing Bulls", points: 36 },
  { first_name: "Isack", last_name: "Hadjar", nationality: "Français", number: 6, team_name: "Racing Bulls", points: 51 }
]

puts "Creating drivers..."

drivers_data.each do |attrs|
  Driver.create!(
    first_name: attrs[:first_name],
    last_name: attrs[:last_name],
    nationality: attrs[:nationality],
    number: attrs[:number],
    team: teams[attrs[:team_name]]
  )
  puts "Driver #{attrs[:first_name]} #{attrs[:last_name]} created."
end

## Seed Races

races_data = [
  { name: "Albert Park Circuit", location: "Australia", all_time_best_time: "1:19.813" },
  { name: "Shanghai International Circuit", location: "China", all_time_best_time: "1:32.238" },
  { name: "Suzuka", location: "Japan", all_time_best_time: "1:30.965" },
  { name: "Bahrain International Circuit", location: "Bahrain", all_time_best_time: "1:31.447" },
  { name: "Jeddah Street Circuit", location: "Saudi Arabia", all_time_best_time: "1:30.734" },
  { name: "Miami International Autodrome", location: "USA - Miami", all_time_best_time: "1:29.708" },
  { name: "Autodromo Enzo e Dino Ferrari", location: "Italy - Emilia Romagna", all_time_best_time: "1:15.484" },
  { name: "Circuit de Monte Carlo", location: "Monaco", all_time_best_time: "1:12.909" },
  { name: "Circuit de Barcelona-Catalunya", location: "Spain", all_time_best_time: "1:16.330" },
  { name: "Circuit Gilles Villeneuve", location: "Canada", all_time_best_time: "1:13.078" },
  { name: "Red Bull Ring", location: "Austria", all_time_best_time: "1:05.619" },
  { name: "Silverstone Circuit", location: "United Kingdom", all_time_best_time: "1:27.097" },
  { name: "Circuit Spa Francorchamps", location: "Belgium", all_time_best_time: "1:44.701" },
  { name: "Hungaroring", location: "Hungary", all_time_best_time: "1:16.627" },
  { name: "Circuit Zandvoort", location: "Netherlands", all_time_best_time: "1:11.097" },
  { name: "Autodromo Nazionale Monza", location: "Italia", all_time_best_time: "1:20.901" },
  { name: "Baku City Circuit", location: "Azerbaijan", all_time_best_time: "1:43.009" },
  { name: "Marina Bay Street Circuit", location: "Singapore", all_time_best_time: "1:33.808" },
  { name: "Circuit of the Americas", location: "USA - Austin", all_time_best_time: "1:36.169" },
  { name: "Autodromo Hermanos Rodriguez", location: "Mexico", all_time_best_time: "1:17.774" },
  { name: "Interlagos", location: "Brazil", all_time_best_time: "1:10.540" },
  { name: "Las Vegas Street Circuit", location: "USA - Las Vegas", all_time_best_time: "1:33.365" },
  { name: "Losail International Circuit", location: "Qatar", all_time_best_time: "1:24.319" },
  { name: "Yas Marina Circuit", location: "Abu Dhabi", all_time_best_time: "1:26.103" }
]

puts "Creating races..."

races_data.each do |race|
  Race.create!(race)
  puts "Race #{race[:name]} created."
end

## Seed race_edition
races = Race.all.index_by(&:name)

race_editions_data = [
  { season: 2024, race_date: "2024-03-03", race_name: "Bahrain International Circuit" },
  { season: 2024, race_date: "2024-03-17", race_name: "Albert Park Circuit" },
  { season: 2024, race_date: "2024-03-31", race_name: "Jeddah Street Circuit" },
  { season: 2024, race_date: "2024-04-07", race_name: "Shanghai International Circuit" },
  { season: 2024, race_date: "2024-04-14", race_name: "Autodromo Enzo e Dino Ferrari" },
  { season: 2024, race_date: "2024-04-21", race_name: "Suzuka" },
  { season: 2024, race_date: "2024-05-05", race_name: "Miami International Autodrome" },
  { season: 2024, race_date: "2024-05-26", race_name: "Circuit de Monte Carlo" },
  { season: 2024, race_date: "2024-06-09", race_name: "Circuit de Barcelona-Catalunya" },
  { season: 2024, race_date: "2024-06-16", race_name: "Circuit Gilles Villeneuve" }
]

puts "Creation races editions"

race_editions_data.each do |attrs|
  race = races[attrs[:race_name]]
  next unless race

  RaceEdition.create!(
    season: attrs[:season],
    race_date: attrs[:race_date],
    race: race
  )
  puts "RaceEdition for #{race.name} created."
end

## Seed resuults

puts "Creating results of race editions..."

points_table = [ 25, 18, 15, 12, 10, 8, 6, 4, 2, 1 ]

RaceEdition.all.each do |edition|
  Driver.all.shuffle.each_with_index do |driver, index|
    Result.create!(
      position: index + 1,
      points: index < 10 ? points_table[index] : 0,
      best_lap_time: "1:#{rand(10..14)}.#{rand(100..999)}",
      driver: driver,
      team: driver.team,
      race_edition: edition
    )
  end
  puts "Results created for #{edition.race.name}."
end

puts "Seeding completed!"
