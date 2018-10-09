# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

Category.destroy_all
p "les categories sont détruite"

Company.destroy_all
p "les companies sont détruite"

p "création des catégories"
sport = Category.create!(title: "Sport")
arts = Category.create!(title: "Arts")
culture = Category.create!(title: "Culture")


p "création des activités"
csv_file_activity   = File.join(__dir__, 'activities.csv')

CSV.foreach(csv_file_activity) do |row|
  if row[0]
    act = Activity.create!(title: row[0], category: sport)
  end
  if row[1]
    act = Activity.create!(title: row[1], category: arts)
  end
  if row[2]
    act = Activity.create!(title: row[2], category: culture)
  end
  p "add #{act.title}"
end

p 'create 3 companies'

back = Company.new(title: "Backmarcket", address: "17 Boulevard de Vaugirard, France", email_domain: "backmarket.com")
monop = Company.new(title: "Monoprix", address: "Rue de Rivoli, 75001 Paris, France", email_domain: "monoprix.com")
commonpoint = Company.new(title: "CommonPoint", address: "Rue de Rivoli, 75001 Paris, France", email_domain: "commonpoint.fr")
back.save
monop.save
commonpoint.save

p "#{commonpoint}"

p " create 20 users"
15.times do |i|
  first_name = Faker::Name.unique.first_name
  last_name = Faker::Name.unique.last_name
  email = [first_name.downcase, back.email_domain].join('@')
  user = User.new(
    first_name: first_name,
    last_name: last_name,
    email: email,
    password: "password"
  )
  user.save
end

User.all.each do |user|
p "#{user.last_name} #{user.company}"
end

p "me"
user = User.new(
  first_name: "Donatien",
  last_name: "Rolland",
  email: "donatien@backmarket.com",
  password: "password"
  )
user.save
p "#{user.last_name} #{user.company}"

p "admin user"
user = User.new(
  first_name:"Thibaud",
  last_name: "Goualard",
  email: "admin@commonpoint.fr",
  password: "courgette7@",
  admin: true
  )
user.save
p "#{user.last_name} #{user.company}"


p "create user_activity"
User.where(admin: false).each do |user|
  Activity.where(category: arts ).each do |activity|
    level_random = rand(1...5)
    UserActivity.create!(level:level_random, description: Faker::Cannabis.category, activity: activity, user: user )
  end
end






