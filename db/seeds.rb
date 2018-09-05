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
    Activity.create!(title: row[0], category: sport, icon: 'swim.png')
  end
  if row[1]
    Activity.create!(title: row[1], category: arts, icon: 'swim.png')
  end
  if row[2]
    Activity.create!(title: row[2], category: culture, icon: 'swim.png')
  end
end

p 'create 2 companies'

back = Company.create!(title: "Backmarcket", address: "17 Boulevard de Vaugirard, France", email_domain: "backmarket.com")
monop = Company.create!(title: "Monoprix", address: "Rue de Rivoli, 75001 Paris, France", email_domain: "monoprix.com")


p " create 20 users"
15.times do |i|
  first_name = Faker::Name.unique.first_name
  email = [first_name.downcase, back.email_domain].join('@')
  p "#{email}"
  user = User.create!(
    first_name: first_name,
    email: email,
    password: "password",
    company: back
  )
  puts "#{i + 1}"
end
p "me"
User.create!(
  first_name: "Donatien",
  email: "donatien@backmarket.com",
  password: "password",
  company: back
  )


p "create user_activity"
User.all.each do |user|
  Activity.where(category: arts ).each do |activity|
    level_random = rand(0...5)
    UserActivity.create!(level:level_random, description: Faker::Cannabis.category, activity: activity, user: user )
  end
end








