# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts ".... SEED STARTING"

puts ".... DESTROY ALL"
Exchange.destroy_all
Shift.destroy_all
User.destroy_all
Line.destroy_all
Unit.destroy_all

puts ".... CREATE UNITS"
#2 units
u1 = Unit.create!(name: "Unit 1")
u2 = Unit.create!(name: "Unit 2")

puts ".... CREATE LINES"
#2 lines
l1 = Line.create!(unit: u1, name: "T1", transport_type: "Tramway")
l2 = Line.create!(unit: u1, name: "T2", transport_type: "Tramway")
l3 = Line.create!(unit: u2, name: "T3", transport_type: "Tramway")
l4 = Line.create!(unit: u1, name: "T4", transport_type: "Tramway")

puts ".... CREATE USERS"
#2 user employee
employee_1 = User.create!(first_name: "Joe", last_name: "Rista", unit: u1, email: "employee_1@gmail.com", matricule: 1234, password: 123456 )
employee_2 = User.create!(first_name: "Jacky", last_name: "Bonvita", unit: u1, email: "employee_2@gmail.com", matricule: 5678, password: 123456 )
employee_3 = User.create!(first_name: "Toto", last_name: "Dupont", unit: u2, email: "employee_3@gmail.com", matricule: 5679, password: 123456 )
employee_3 = User.create!(first_name: "Titi", last_name: "TOCTOC", unit: u1, email: "employee_4@gmail.com", matricule: 5673, password: 123456 )

#1 user manager
manager = User.create!(first_name: "Michelle", last_name: "Obama", unit: u1, email: "manager@gmail.com", matricule: 23445, manager: true, password: 123456 )

puts ".... CREATE SHIFTS"
#2 shifts en-cours (demande user 1)
shift1 = Shift.create!(
  date: Date.today,
  line: l1,
  hour_start: Time.new(2020,9,15,7,5,0).strftime("%H:%M"),
  hour_end: Time.new(2020,9,15,16,5,0).strftime("%H:%M"),
  working_hours: Time.new(2020,9,15,16,5,0).strftime("%H:%M"), # 7h = 25200 seconds -- SECONDS ?
  user: employee_1
)

shift2 = Shift.create!(
  date: Date.today + 6,
  line: l1,
  hour_start: Time.new(2020,10,11,11,35,0).strftime("%H:%M"),
  hour_end: Time.new(2020,10,11,20,15,0).strftime("%H:%M"),
  working_hours: Time.new(2020,9,16,16,5,0).strftime("%H:%M"), # 7h = 22000 seconds -- SECONDS ?
  user: employee_1
)
#1 shift reponse
shift3 = Shift.create!(
  date: Date.today + 1,
  line: l2,
  hour_start: Time.new(2020,9,18,9,35,0).strftime("%H:%M"),
  hour_end: Time.new(2020,9,18,16,15,0).strftime("%H:%M"),
  working_hours: Time.new(2020,9,17,16,5,0).strftime("%H:%M"), # 7h = 22000 seconds -- SECONDS ?
  user: employee_2
)

shift4 = Shift.create!(
  date: Date.today + 2,
  line: l1,
  hour_start: Time.new(2020,8,8,11,35,0).strftime("%H:%M"),
  hour_end: Time.new(2020,8,8,20,15,0).strftime("%H:%M"),
  working_hours: Time.new(2020,9,18,16,5,0).strftime("%H:%M"), # 7h = 22000 seconds -- SECONDS ?
  user: employee_1
)
#1 shift reponse
shift5 = Shift.create!(
  date: Date.today + 3,
  line: l2,
  hour_start: Time.new(2020,9,20,9,35,0).strftime("%H:%M"),
  hour_end: Time.new(2020,9,20,16,15,0).strftime("%H:%M"),
  working_hours: Time.new(2020,9,19,16,5,0).strftime("%H:%M"), # 7h = 22000 seconds -- SECONDS ?
  user: employee_2
)

shift6 = Shift.create!(
  date: Date.today - 6,
  line: l2,
  hour_start: Time.new(2020,9,20,9,35,0).strftime("%H:%M"),
  hour_end: Time.new(2020,9,20,16,15,0).strftime("%H:%M"),
  working_hours: Time.new(2020,9,19,16,5,0).strftime("%H:%M"), # 7h = 22000 seconds -- SECONDS ?
  user: employee_2
)

shift7 = Shift.create!(
  date: Date.today - 5,
  line: l2,
  hour_start: Time.new(2020,9,20,9,35,0).strftime("%H:%M"),
  hour_end: Time.new(2020,9,20,16,15,0).strftime("%H:%M"),
  working_hours: Time.new(2020,9,19,16,5,0).strftime("%H:%M"), # 7h = 22000 seconds -- SECONDS ?
  user: employee_2
)
puts ".... CREATE EXCHANGES"

#1 exchange avec une reponse
exchange1 = Exchange.create(
  shift_owner_id: shift1.id,
  shift_answer_id: shift2.id,
  accepted_owner: nil,
  accepted_manager: nil
)

exchange2 = Exchange.create(
  shift_owner_id: shift1.id,
  shift_answer_id: shift3.id,
  accepted_owner: nil,
  accepted_manager: nil
)
#1 exchange avec une reponse acceptee par le owner
exchange3 = Exchange.create(
  shift_owner_id: shift4,
  shift_answer_id: shift5,
  accepted_owner: true,
  accepted_manager: nil
)

exchange4 = Exchange.create(
  shift_owner_id: shift4,
  shift_answer_id: shift5,
  accepted_owner: true,
  accepted_manager: true
)

exchange5 = Exchange.create(
  shift_owner_id: shift6,
  shift_answer_id: shift7,
  accepted_owner: nil,
  accepted_manager: false
)
puts ".... SEED OK ...."


puts ".... START CUSTOM SEED"


Exchange.destroy_all
Shift.destroy_all


joe = User.find_by(first_name: 'Joe')
jacky = User.find_by(first_name: 'Jacky')
toto = User.find_by(first_name: 'Toto')
titi = User.find_by(first_name: 'Titi')

l1 = Line.find_by(name: "T1")
l2 = Line.find_by(name: "T2")
l3 = Line.find_by(name: "T3")
l4 = Line.find_by(name: "T4")



Shift.create!(
  date: Date.today,
  line: l1,
  hour_start: Time.new(2020,9,15,7,5,0).strftime("%H:%M"),
  hour_end: Time.new(2020,9,15,16,5,0).strftime("%H:%M"),
  working_hours: Time.new(2020,9,15,16,5,0).strftime("%H:%M"), # 7h = 25200 seconds -- SECONDS ?
  user: joe
)

Shift.create!(
  date: Date.today,
  line: l3,
  hour_start: Time.new(2020,9,15,7,5,0).strftime("%H:%M"),
  hour_end: Time.new(2020,9,15,16,5,0).strftime("%H:%M"),
  working_hours: Time.new(2020,9,15,16,5,0).strftime("%H:%M"), # 7h = 25200 seconds -- SECONDS ?
  user: toto
)

Shift.create!(
  date: Date.yesterday,
  line: l1,
  hour_start: Time.new(2020,9,15,7,5,0).strftime("%H:%M"),
  hour_end: Time.new(2020,9,15,16,5,0).strftime("%H:%M"),
  working_hours: Time.new(2020,9,15,16,5,0).strftime("%H:%M"), # 7h = 25200 seconds -- SECONDS ?
  user: jacky
)

Shift.create!(
  date: Date.today,
  line: l1,
  hour_start: Time.new(2020,9,15,7,5,0).strftime("%H:%M"),
  hour_end: Time.new(2020,9,15,16,5,0).strftime("%H:%M"),
  working_hours: Time.new(2020,9,15,16,5,0).strftime("%H:%M"), # 7h = 25200 seconds -- SECONDS ?
  user: jacky
)

##############################

shift_without_exchange = Shift.create!(
  date: Date.tomorrow,
  line: l1,
  hour_start: Time.new(2020,9,15,7,5,0).strftime("%H:%M"),
  hour_end: Time.new(2020,9,15,16,5,0).strftime("%H:%M"),
  working_hours: Time.new(2020,9,15,16,5,0).strftime("%H:%M"), # 7h = 25200 seconds -- SECONDS ?
  user: jacky
)


shift_with_exchange1 = Shift.create!(
  date: 2.days.from_now,
  line: l1,
  hour_start: Time.new(2020,9,15,7,5,0).strftime("%H:%M"),
  hour_end: Time.new(2020,9,15,16,5,0).strftime("%H:%M"),
  working_hours: Time.new(2020,9,15,16,5,0).strftime("%H:%M"), # 7h = 25200 seconds -- SECONDS ?
  user: joe
)


shift_with_exchange2 = Shift.create!(
  date: 2.days.from_now,
  line: l2,
  hour_start: Time.new(2020,9,15,7,5,0).strftime("%H:%M"),
  hour_end: Time.new(2020,9,15,16,5,0).strftime("%H:%M"),
  working_hours: Time.new(2020,9,15,16,5,0).strftime("%H:%M"), # 7h = 25200 seconds -- SECONDS ?
  user: jacky
)

exchange1 = Exchange.create!(
  shift_owner: shift_with_exchange1,
  shift_answer: shift_with_exchange2,
  accepted_owner: true,
  accepted_manager: nil
)


shift_with_exchange3 = Shift.create!(
  date: 3.days.from_now,
  line: l1,
  hour_start: Time.new(2020,9,15,7,5,0).strftime("%H:%M"),
  hour_end: Time.new(2020,9,15,16,5,0).strftime("%H:%M"),
  working_hours: Time.new(2020,9,15,16,5,0).strftime("%H:%M"), # 7h = 25200 seconds -- SECONDS ?
  user: joe
)


shift_with_exchange4 = Shift.create!(
  date: 4.days.from_now,
  line: l2,
  hour_start: Time.new(2020,9,15,7,5,0).strftime("%H:%M"),
  hour_end: Time.new(2020,9,15,16,5,0).strftime("%H:%M"),
  working_hours: Time.new(2020,9,15,16,5,0).strftime("%H:%M"), # 7h = 25200 seconds -- SECONDS ?
  user: jacky
)

shift_with_exchange5 = Shift.create!(
  date: 4.days.from_now,
  line: l4,
  hour_start: Time.new(2020,9,15,7,5,0).strftime("%H:%M"),
  hour_end: Time.new(2020,9,15,16,5,0).strftime("%H:%M"),
  working_hours: Time.new(2020,9,15,16,5,0).strftime("%H:%M"), # 7h = 25200 seconds -- SECONDS ?
  user: titi
)


exchange2 = Exchange.create!(
  shift_owner: shift_with_exchange4,
  shift_answer: shift_with_exchange3,
  accepted_owner: true,
  accepted_manager: nil
)

exchange3 = Exchange.create!(
  shift_owner: shift_with_exchange4,
  shift_answer: shift_with_exchange5,
  accepted_owner: nil,
  accepted_manager: nil
)



shift_with_exchange6 = Shift.create!(
  date: 5.days.from_now,
  line: l2,
  hour_start: Time.new(2020,9,15,7,5,0).strftime("%H:%M"),
  hour_end: Time.new(2020,9,15,16,5,0).strftime("%H:%M"),
  working_hours: Time.new(2020,9,15,16,5,0).strftime("%H:%M"), # 7h = 25200 seconds -- SECONDS ?
  user: jacky
)

shift_with_exchange7 = Shift.create!(
  date: 5.days.from_now,
  line: l4,
  hour_start: Time.new(2020,9,15,7,5,0).strftime("%H:%M"),
  hour_end: Time.new(2020,9,15,16,5,0).strftime("%H:%M"),
  working_hours: Time.new(2020,9,15,16,5,0).strftime("%H:%M"), # 7h = 25200 seconds -- SECONDS ?
  user: titi
)


shift_with_exchange8 = Shift.create!(
  date: 6.days.from_now,
  line: l4,
  hour_start: Time.new(2020,9,15,7,5,0).strftime("%H:%M"),
  hour_end: Time.new(2020,9,15,16,5,0).strftime("%H:%M"),
  working_hours: Time.new(2020,9,15,16,5,0).strftime("%H:%M"), # 7h = 25200 seconds -- SECONDS ?
  user: titi
)

shift_with_exchange9 = Shift.create!(
  date: 7.days.from_now,
  line: l2,
  hour_start: Time.new(2020,9,15,7,5,0).strftime("%H:%M"),
  hour_end: Time.new(2020,9,15,16,5,0).strftime("%H:%M"),
  working_hours: Time.new(2020,9,15,16,5,0).strftime("%H:%M"), # 7h = 25200 seconds -- SECONDS ?
  user: jacky
)


shift_with_exchange10 = Shift.create!(
  date: 8.days.from_now,
  line: l4,
  hour_start: Time.new(2020,9,15,7,5,0).strftime("%H:%M"),
  hour_end: Time.new(2020,9,15,16,5,0).strftime("%H:%M"),
  working_hours: Time.new(2020,9,15,16,5,0).strftime("%H:%M"), # 7h = 25200 seconds -- SECONDS ?
  user: titi
)


exchange3 = Exchange.create!(
  shift_owner: shift_with_exchange6,
  shift_answer: shift_with_exchange7,
  accepted_owner: nil,
  accepted_manager: nil
)


exchange3 = Exchange.create!(
  shift_owner: shift_with_exchange6,
  shift_answer: shift_with_exchange8,
  accepted_owner: true,
  accepted_manager: nil
)

exchange4 = Exchange.create!(
  shift_owner: shift_with_exchange9,
  shift_answer: shift_with_exchange10,
  accepted_owner: true,
  accepted_manager: true
)


puts ".... CUSTOM SEED OK"
