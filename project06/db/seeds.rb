# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Role.delete_all

admin = Role.create(name: "Admin")
member = Role.create(name: "Member")

User.create(username: "administrator", first_name: "admin", last_name: "istrator", email: "administrator@admin.com", password: "password", role_id: admin.id)
User.create(username: "member", first_name: "mem", last_name: "ber", email: "member@mem.com", password: "password", role_id: member.id)