# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Users
u1 = User.create(name: "Harry", last_name: "Styles", telephone = "+56 9 2456 1982", email = "hsTPWK@gmail.com", role = "admin")
u2 = User.create(name: "John", last_name: "Mayer", telephone = "+56 9 5567 9876", email = "johnMayer26@gmail.com", role = "supervisor")
u3 = User.create(name: "Phoebe", last_name: "Bridgers", telephone = "+56 9 7654 9833", email = "phoebe_b@gmail.com", role = "supervisor")
u4 = User.create(name: "Luke", last_name: "Hemmings", telephone = "+56 9 5423 8877", email = "hemmings5sos@gmail.com", role = "executive")
u5 = User.create(name: "Ashton", last_name: "Irwin", telephone = "+56 9 1543 8745", email = "AshIrw_shelookssoperfect@gmail.com", role = "executive")
u6 = User.create(name: "Taylor", last_name: "Swift", telephone = "+56 9 6254 7365", email = "TheOldTaylorCantComeToThePhoneRightNow@gmail.com", role = "req_user")
u7 = User.create(name: "Freddy", last_name: "Mercury", telephone = "+56 1542 3274", email = "EOeoEO@gmail.com", role = "req_user")
u8 = User.create(name: "Sufjan", last_name: "Stevens", telephone = "+56 9 2019 2021", email = "sufjst543@gmail.com", role = "req_user")

#Requiring users:
ru1 = RequiringUser.create(user_id: u6.id)
ru2 = RequiringUser.create(user_id: u7.id)
ru3 = RequiringUser.create(user_id: u8.id)

#Executives:
e1 = Executive.create(user_id: u4.id)
e1 = Executive.create(user_id: u5.id)

#Supervisor:
s1 = Supervisor.create(user_id: u1.id, administrator: True)
s2 = Supervisor.create(user_id: u2.id, administrator: False)
s3 = Supervisor.create(user_id: u3.id, administrator: False)

#Tickets:
t1 = Ticket.create(creation_date: Date.new(2023,4,6), resolution_date: Date.new(2023,4,8), deadline_date: Date.new(2023,4,9), title: "Problemas con reunión", description: "No se están realizando las reuniones correspondientes en el área de comunicaciones", priority = 2, state = "closed", requiring_user_id = ru1.id, executive_id = e1.id)
t2 = Ticket.create(creation_date: Date.new(2023,2,20), resolution_date: Date.new(2023,2,28), deadline_date: Date.new(2023,4,9), title: "Problemas con reunión", description: "No se están realizando las reuniones correspondientes en el área de comunicaciones", priority = 2, state = "closed", requiring_user_id = ru1.id, executive_id = e1.id)
t3 = Ticket.create(creation_date: Date.new(2023, 4, 10),resolution_date: Date.new(2023, 4, 12),deadline_date: Date.new(2023, 4, 15),title: "Problemas con el sistema de facturación",description: "El sistema de facturación no está generando correctamente los reportes mensuales",priority: 1,state: "open",requiring_user_id: ru2.id,executive_id: e2.id)


att1 = Attachment.create(title: "")