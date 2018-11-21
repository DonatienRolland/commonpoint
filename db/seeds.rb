require 'csv'

# Category.destroy_all
# p "les categories sont détruite"

Company.destroy_all
p "les companies sont détruites"

# p "création des catégories"
# sport = Category.create!(title: "Sport")
# arts = Category.create!(title: "Arts")
# culture = Category.create!(title: "Culture")


# p "création des activités"
# csv_file_activity   = File.join(__dir__, 'activities.csv')

# CSV.foreach(csv_file_activity) do |row|
#   if row[0]
#     act = Activity.create!(title: row[0], category: sport)
#   end
#   if row[1]
#     act = Activity.create!(title: row[1], category: arts)
#   end
#   if row[2]
#     act = Activity.create!(title: row[2], category: culture)
#   end
#   p "add #{act.title}"
# end

# commonpoint = Company.create!(title: "CommonPoint", address: "Rue de Rivoli, 75001 Paris, France", email_domain: "commonpoint.fr")


# p "admin user"
# user = User.new(
#   first_name:"Thibaud",
#   last_name: "Goualard",
#   email: "admin@commonpoint.fr",
#   password: "courgette7@",
#   admin: true
#   )
# user.save
# p "#{user.last_name} #{user.company}"


# Partie Local

companyTest = Company.create!(title: "Apple", address: "Rue de Rivoli, 75001 Paris, France", email_domain: "apple.fr")

100.times do
  first_name = Faker::Name.unique.first_name
  last_name = Faker::Name.unique.last_name
  user_email = [first_name.downcase, companyTest.email_domain].join('@')
  user = User.create!(
    first_name: first_name,
    last_name: last_name,
    email: user_email,
    company: companyTest,
    password: "password",
    admin: false
  )
end

p "Création d'activité pour les users"
User.where(admin: false).each do |user|

  count = Activity.all.count
  5.times do
    activity = Activity.all[rand(0...count)]
    level_random = rand(0..2)
    user_act = UserActivity.new(level:level_random, description: Faker::Cannabis.category, activity: activity, user: user )
    user_act.save
  end
  p "Création de 5 activité pour #{user.first_name}"
end
p "Creation des points"
User.where(admin: false).each do |user|
  p 'Création de point'
  count = UserActivity.where(user: user).count
  5.times do |i|
    statut = i.odd? ? "Privé" : "Publique"
    user_activity = UserActivity.where(user: user)[rand(0...count)]
    user_activity_id = user_activity.id
    price_activity =  (rand*100).round(2)
    px = price_activity.between?(20, 50) ? nil : price_activity
    pt_address = Faker::Address.full_address
    pt_date = Faker::Date.between(1.month.ago, 3.month.from_now)
    nmb_min = rand(0..10)
    point = Point.create(
      price: px,
      number_min: nmb_min,
      number_max: rand(nmb_min...15),
      address: pt_address,
      type_of_point: statut,
      user_id: user.id,
      user_activity_id: user_activity_id,
      latitude: nil,
      longitude: nil,
      date: pt_date,
      full: false,
    )
    point.generate_participants(user)
    p "points #{i} #{statut}"
  end
end

p 'Random participation au point'
User.where(admin: false).each do |user|
  Participant.where(user:user, invited:true).each do |participant|
    random = rand(0...100)
    if !participant.point.is_full?
      stat = random.odd? ? "I'm in" : "I can't"
      participant.status = stat
      participant.save
    end
  end
end








