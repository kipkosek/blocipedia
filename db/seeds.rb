#Create Standard Users
5.times do
  User.create!(
  username: Faker::StarWars.unique.character,
  email: Faker::Internet.unique.email,
  password: Faker::Internet.unique.password(8)
  )
end
users = User.all

#Create Premium User
premium = User.create!(
  username: 'Premium User',
  email: 'premium@example.com',
  password: 'helloworld',
  role: 'premium'
)

#Create Admin User
admin = User.create!(
  username: 'Admin User',
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
)

#Create Public Wikis
20.times do
  wiki = Wiki.create!(
    user: users.sample,
    title: Faker::StarWars.unique.planet,
    body: Faker::StarWars.unique.quote
  )
end
wikis = Wiki.all

#Create Private Wiki
wiki_private = Wiki.create!(
  user: premium,
  title: "Private Test Wiki",
  body: "Text of private test wiki",
  private: true
)


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
