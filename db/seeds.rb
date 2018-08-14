# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

Activity.destroy_all
p "les activités sont détruite"
Category.destroy_all
p "les categories sont détruite"

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

