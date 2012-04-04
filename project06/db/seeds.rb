# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Role.delete_all
Game.delete_all

admin = Role.create(name: "Admin")
member = Role.create(name: "Member")

User.create(username: "administrator", first_name: "admin", last_name: "istrator", email: "administrator@admin.com", password: "password", role_id: admin.id)

yong = User.create(username: "ybakos", first_name: "Yong", last_name: "bakos", email: "bakos73@gmail.com", password: "password", role_id: member.id)
user = User.create(username: "member", first_name: "mem", last_name: "ber", email: "member@mem.com", password: "password", role_id: member.id)

users = [yong, user]
roles = [admin, member]

for i in 0..100
	users << User.create(username: "userxxx#{i}", first_name: "Garen #{i}", last_name: "Smith #{i}", email: "member@mem.com", password: "password", role_id: (roles.shuffle!)[0].id)
end

for i in 0..100
	rating = rand(5)
	if rating != 5
		text = Game::RATINGS[rating]
	else
		text = ""
	end
	Game.create(title: "Call of Doodle #{i}", rating: text, user_id: (users.shuffle!)[0].id)
end