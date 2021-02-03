require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
CSV.foreach('db/csv/prev_users.csv', headers: true) do |row|
  user = User.new(
    email: row['email'],
    name: row['name'],
    introduction: row['introduction'],
    encrypted_password: row['encrypted_password']
  )
  user.skip_password_validation = true
  user.save
end
CSV.foreach('db/csv/prev_rewords.csv', headers: true) do |row|
  p row["2"]
  p "parse", JSON.parse(row["2"])
  User.find(row["user_id"]).reword.update(
    "2"=> JSON.parse(row["2"]) ,
    "3"=> JSON.parse(row["3"]) ,
    "4"=> JSON.parse(row["4"]) ,
    "5"=> JSON.parse(row["5"]) ,
    "6"=> JSON.parse(row["6"]) ,
    "7"=> JSON.parse(row["7"]),
    "8"=> JSON.parse(row["8"]) ,
    "9"=> JSON.parse(row["9"]) ,
    "10"=> JSON.parse(row["10"]),
    total: row["total"],
    success: row["successs"]
  )
end

20.times do
  password = Faker::Internet.password
  User.create(email: Faker::Internet.email, name:  Faker::Name.name, password: password, password_confirmation: 
    password )
end