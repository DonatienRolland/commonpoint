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

commonpoint = Company.create!(title: "CommonPoint", address: "Rue de Rivoli, 75001 Paris, France", email_domain: "commonpoint.fr")


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







