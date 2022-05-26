# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
users = [{name: 'test user', email: 'test@gmail.com'}]

users.each do |user|
  User.create(user)
end

lines = [{source: "A", destination: "B", status: 0},
  {source: "B", destination: "C", status: 0},
  {source: "C",destination: 'A', status: 0},
  { source: "B", destination: "A", status: 0},
  { source: "C", destination: "B", status: 0},
  { source: "A",destination: 'C', status: 0}
]

lines.each do |line|
  Line.create(line)
end

trains = [ {name: 'Thomas', cost: 200, total_weight: 500, total_volume: 8,line_id: 1, status: 0}, 
  {name: 'Percy', cost: 150, total_weight: 150, total_volume: 1, line_id: 2, status: 0}, 
  {name: 'Evelyn',cost: 300, total_weight: 300, total_volume: 4,line_id:6, status: 0}, 
  {name: 'Toby ',cost: 300, total_weight: 300, total_volume: 2, line_id: 2, status: 0} 
]

trains.each do |train|
  Train.create(train)
end
