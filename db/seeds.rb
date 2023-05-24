# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Users
u1 = User.create(name: "Harry", last_name: "Styles", telephone: "+56 9 2456 1982", email: "hsTPWK@gmail.com", role: "admin")
u2 = User.create(name: "John", last_name: "Mayer", telephone: "+56 9 5567 9876", email: "johnMayer26@gmail.com", role: "supervisor")
u3 = User.create(name: "Phoebe", last_name: "Bridgers", telephone: "+56 9 7654 9833", email: "phoebe_b@gmail.com", role: "supervisor")
u4 = User.create(name: "Luke", last_name: "Hemmings", telephone: "+56 9 5423 8877", email: "hemmings5sos@gmail.com", role: "executive")
u5 = User.create(name: "Ashton", last_name: "Irwin", telephone: "+56 9 1543 8745", email: "AshIrw_shelookssoperfect@gmail.com", role: "executive")
u6 = User.create(name: "Taylor", last_name: "Swift", telephone: "+56 9 6254 7365", email: "TheOldTaylorCantComeToThePhoneRightNow@gmail.com", role: "req_user")
u7 = User.create(name: "Freddy", last_name: "Mercury", telephone: "+56 1542 3274", email: "EOeoEO@gmail.com", role: "req_user")
u8 = User.create(name: "Sufjan", last_name: "Stevens", telephone: "+56 9 2019 2021", email: "sufjst543@gmail.com", role: "req_user")

#Requiring users:
ru1 = RequiringUser.create(user_id: u6.id)
ru2 = RequiringUser.create(user_id: u7.id)
ru3 = RequiringUser.create(user_id: u8.id)

#Executives:
e1 = Executive.create(user_id: u4.id)
e2 = Executive.create(user_id: u5.id)

#Supervisor:
s1 = Supervisor.create(user_id: u1.id, administrator: true)
s2 = Supervisor.create(user_id: u2.id, administrator: false)
s3 = Supervisor.create(user_id: u3.id, administrator: false)

#Tickets:
t1 = Ticket.create(creation_date: Date.new(2023,4,6), resolution_date: Date.new(2023,4,8), deadline_date: Date.new(2023,4,9), title: "Problemas con reunión", description: "No se están realizando las reuniones correspondientes en el área de comunicaciones", priority: 2, state: "closed", requiring_user_id: ru1.id, executive_id: e1.id)
t2 = Ticket.create(creation_date: Date.new(2023,2,20), resolution_date: Date.new(2023,2,28), deadline_date: Date.new(2023,2,25), title: "Máquina de café rota", description: "La máquina de café de la sala 2 está rota y no han ido a arreglarla hace dos semanas", priority: 3, state: "closed", requiring_user_id: ru2.id, executive_id: e1.id)
t3 = Ticket.create(creation_date: Date.new(2023,4,10),resolution_date: Date.new(2023, 4, 12),deadline_date: Date.new(2023, 4, 12),title: "Problemas con el sistema de facturación",description: "El sistema de facturación no está generando correctamente los reportes mensuales",priority: 1, state: "reopened",requiring_user_id: ru3.id,executive_id: e2.id)
t4 = Ticket.create(creation_date: Date.new(2023, 5, 1), resolution_date: nil, deadline_date: Date.new(2023, 5, 4), title: "Error en el módulo de inventario", description: "El módulo de inventario muestra cantidades incorrectas para ciertos productos", priority: 2, state: "open", requiring_user_id: ru1.id, executive_id: e2.id)
t5 = Ticket.create(creation_date: Date.new(2023, 5, 10), resolution_date: Date.new(2023, 5, 15), deadline_date: Date.new(2023, 5, 15), title: "Problema con la página de inicio", description: "La página de inicio no carga correctamente y muestra un error 500", priority: 3, state: "closed", requiring_user_id: ru2.id, executive_id: e1.id)
t6 = Ticket.create(creation_date: Date.new(2023, 5, 18), resolution_date: nil, deadline_date: Date.new(2023, 5, 20), title: "Error en el proceso de pago", description: "Los usuarios no pueden completar el proceso de pago en la plataforma", priority: 1, state: "open", requiring_user_id: ru1.id, executive_id: e1.id)
t7 = Ticket.create(creation_date: Date.new(2023, 5, 19), resolution_date: nil, deadline_date: Date.new(2023, 5, 22), title: "Solicitud de cambio en la interfaz de usuario", description: "Se solicita realizar modificaciones en la interfaz de usuario para mejorar la experiencia del usuario", priority: 2, state: "open", requiring_user_id: ru3.id, executive_id: e2.id)
t8 = Ticket.create(creation_date: Date.new(2023, 3, 20), resolution_date: nil, deadline_date: Date.new(2023, 3, 25), title: "Problema de conexión con el servidor", description: "Los usuarios experimentan dificultades para conectarse al servidor", priority: 3, state: "open", requiring_user_id: ru1.id, executive_id: e2.id)
t9 = Ticket.create(creation_date: Date.new(2023, 1, 8), resolution_date: Date.new(2023, 1, 10), deadline_date: Date.new(2023, 1, 11), title: "Error en el proceso de registro", description: "Los usuarios no pueden completar el proceso de registro debido a un error en el sistema", priority: 2, state: "closed", requiring_user_id: ru2.id, executive_id: e2.id)
t10 = Ticket.create(creation_date: Date.new(2023, 2, 3), resolution_date: Date.new(2023, 5, 8), deadline_date: Date.new(2023, 5, 5), title: "Problema con la funcionalidad de búsqueda", description: "La función de búsqueda no muestra resultados correctos para ciertos términos de búsqueda", priority: 1, state: "closed", requiring_user_id: ru3.id, executive_id: e1.id)

#Attachments:
att1 = Attachment.create(title: "Interfaz Actual usuario",path: "/usr/files/ss_interfaz_usuario.jpg", ticket_id: t7.id)
att2 = Attachment.create(title: "Foto del error del sistema", path: "/usr/files/ss_error_facturación.jpg",ticket_id: t3.id)
att3 = Attachment.create(title: "Respuesta servidor", path: "/usr/files/respuesta_servidor.pdf",ticket_id: t8.id)

#Comments:
c1 = Comment.create(comment: "Hola! No soy del área de comunicaciones, ¿con quien puedo hablar?", executive_id: t1.executive_id, ticket_id: t1.id)
c2 = Comment.create(comment: "Hola, las reuniones las decide el jefe correspondiente al inicio del año y no tienen que ver con el área en si, espero eso te ayude a gestionar.", executive_id: e2.id, ticket_id: t1.id)
c3 = Comment.create(comment: "Ok, entonces no hay nada que hacer, gracias.", executive_id: t1.executive_id, ticket_id: t1.id)
c4 = Comment.create(comment: "La gente con las credenciales antiguas tenía ese problema ¿no es así?", executive_id: t5.executive_id, ticket_id: t5.id)
c5 = Comment.create(comment: "Sí, la página ya no soporta las credenciales antiguas y se cae. Saludos", executive_id: e2.id, ticket_id: t5.id)
c6 = Comment.create(comment: "Revisé la página y no me sale ningún problema.", executive_id: t3.executive_id, ticket_id: t3.id)
c7 = Comment.create(comment: "Ese problema ya se solucionó, saludos.", executive_id: e1.id, ticket_id: t3.id)
c8 = Comment.create(comment: "Hola! El ticket fue reabierto, aparentemente a algunos computadores todavía no les funciona el sistema.", executive_id: t3.executive_id, ticket_id: t3.id)
c9 = Comment.create(comment: "Realicé un chequeo mensual, efectivamente los reportes no se están generando correctamente.", executive_id: t3.executive_id, ticket_id: t3.id)
c10 = Comment.create(comment: "En tal caso hay que hablar con algún supervisor, ellos conocen más de la página.", executive_id: e1.id, ticket_id: t3.id)
c11 = Comment.create(comment: "RECORDATORIO: Revisar bien cuales son las credenciales habilitadas para el servidor.", executive_id: t8.executive_id, ticket_id: t8.id)
c12 = Comment.create(comment: "Hay algunos permisos no habilitados en mensajes.", executive_id: t8.executive_id, ticket_id: t8.id)
c13 = Comment.create(comment: "Solucionado, mandar respuesta de credenciales cuanto antes.", executive_id: t8.executive_id, ticket_id: t8.id)
c14 = Comment.create(comment: "Recordatorio: Error de credenciales antiguas, mandar respuesta y especificar cuanto antes.", executive_id: t9.executive_id, ticket_id: t9.id)


#Responses:
r1 = Response.create(response: "Estimado/a, vendrán el jueves a repararla, gracias por avisar.", acceptance: true, evaluation: 4.5, ticket_id: t2.id, executive_id: t2.executive_id, requiring_user_id: t2.requiring_user_id)
r2 = Response.create(response: "Estimado/a, la cantidad de reuniones las determina el jefe de cada área, coordinar con él/ella.", acceptance: true, evaluation: 2.0, ticket_id: t1.id, executive_id: t1.executive_id, requiring_user_id: t1.requiring_user_id)
r3 = Response.create(response: "Estimado/a, el sistema de facturación ya se arregló, favor revisar nuevamente si funciona correctamente", acceptance: true, ticket_id: t3.id, executive_id: t3.executive_id, requiring_user_id: t3.requiring_user_id)
r4 = Response.create(response: "Estimado/a, el sistema de facturación ya se arregló, favor revisar nuevamente si funciona correctamente", acceptance: true, ticket_id: t3.id, executive_id: t3.executive_id, requiring_user_id: t3.requiring_user_id)
r5 = Response.create(response: "Estimado/a, eso le ocurre a los usuario con el formato antiguo, hay que cambiar el mail y utilizar una cuenta gmail, saludos", acceptance: true, evaluation: 4, ticket_id: t5.id, executive_id: t5.executive_id, requiring_user_id: t5.requiring_user_id)
r6 = Response.create(response: "Intentar con las siguientes credenciales: 
nombre: WebTech
contraseña: webTech_123", acceptance: false, ticket_id: t8.id, executive_id: t8.executive_id, requiring_user_id: t8.requiring_user_id)
r7 = Response.create(response: "Se debe utilizar una cuenta gmail para hacer el registro, espero que eso ayude.", acceptance: true, evaluation: 4.0, ticket_id: t9.id, executive_id: t9.executive_id, requiring_user_id: t9.requiring_user_id)
r8  = Response.create(response: "Era un problema con los permisos, ya está solucionado, favor confirmar.", acceptance: true, evaluation: 3.5, ticket_id: t10.id, executive_id: t10.executive_id, requiring_user_id: t10.requiring_user_id)

#Executive Metrics:
#Se crean según tickets y sus estados. 

#Tags:
tag1 = Tag.create(name: "Plataforma Web")
tag2 = Tag.create(name: "Personal")
tag3 = Tag.create(name: "Prioridad Alta")
tag4 = Tag.create(name: "Salud")
tag5 = Tag.create(name: "Administración")
tag6 = Tag.create(name: "Problema técnico")
tag7 = Tag.create(name: "Con adjunto")
tag8 = Tag.create(name: "Error")
tag9 = Tag.create(name: "Problema")
tag10 = Tag.create(name: "Solicitud")
tag11 = Tag.create(name: "Urgente")

#Tags and Tickets:
tt1 = TagsTicket.create(ticket_id: t1.id, tag_id: tag2.id)
tt2 = TagsTicket.create(ticket_id: t1.id, tag_id: tag5.id)
tt3 = TagsTicket.create(ticket_id: t1.id, tag_id: tag9.id)
tt4 = TagsTicket.create(ticket_id: t2.id, tag_id: tag6.id)
tt5 = TagsTicket.create(ticket_id: t2.id, tag_id: tag9.id)
tt6 = TagsTicket.create(ticket_id: t3.id, tag_id: tag3.id)
tt7 = TagsTicket.create(ticket_id: t3.id, tag_id: tag5.id)
tt8 = TagsTicket.create(ticket_id: t3.id, tag_id: tag6.id)
tt9 = TagsTicket.create(ticket_id: t3.id, tag_id: tag7.id)
tt10 = TagsTicket.create(ticket_id: t3.id, tag_id: tag9.id)
tt11 = TagsTicket.create(ticket_id: t3.id, tag_id: tag11.id)
tt12 = TagsTicket.create(ticket_id: t4.id, tag_id: tag6.id)
tt13 = TagsTicket.create(ticket_id: t4.id, tag_id: tag8.id)
tt14 = TagsTicket.create(ticket_id: t5.id, tag_id: tag1.id)
tt15 = TagsTicket.create(ticket_id: t5.id, tag_id: tag6.id)
tt16 = TagsTicket.create(ticket_id: t6.id, tag_id: tag3.id)
tt17 = TagsTicket.create(ticket_id: t6.id, tag_id: tag6.id)
tt18 = TagsTicket.create(ticket_id: t6.id, tag_id: tag9.id)
tt19 = TagsTicket.create(ticket_id: t6.id, tag_id: tag11.id)
tt20 = TagsTicket.create(ticket_id: t7.id, tag_id: tag1.id)
tt21 = TagsTicket.create(ticket_id: t7.id, tag_id: tag2.id)
tt22 = TagsTicket.create(ticket_id: t7.id, tag_id: tag7.id)
tt23 = TagsTicket.create(ticket_id: t7.id, tag_id: tag10.id)
tt24 = TagsTicket.create(ticket_id: t8.id, tag_id: tag1.id)
tt25 = TagsTicket.create(ticket_id: t8.id, tag_id: tag6.id)
tt26 = TagsTicket.create(ticket_id: t8.id, tag_id: tag7.id)
tt27 = TagsTicket.create(ticket_id: t8.id, tag_id: tag9.id)
tt28 = TagsTicket.create(ticket_id: t9.id, tag_id: tag1.id)
tt29 = TagsTicket.create(ticket_id: t9.id, tag_id: tag6.id)
tt30 = TagsTicket.create(ticket_id: t9.id, tag_id: tag8.id)
tt31 = TagsTicket.create(ticket_id: t10.id, tag_id: tag3.id)
tt32 = TagsTicket.create(ticket_id: t10.id, tag_id: tag6.id)
tt33 = TagsTicket.create(ticket_id: t10.id, tag_id: tag9.id)
tt34 = TagsTicket.create(ticket_id: t10.id, tag_id: tag11.id)

#Ideas:
#Que la evaluation sea dando estrellas (si no es muy dificil) onda cuando se ponen las 5 y te hacen como pintar las que quieres dar