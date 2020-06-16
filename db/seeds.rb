# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Exchange.destroy_all
Shift.destroy_all
User.destroy_all
Line.destroy_all
Unit.destroy_all
#2 units
u1 = Unit.create!(name: "Unit 1")
u2 = Unit.create!(name: "Unit 2")

#2 lines
l1 = Line.create!(unit_id: Unit.find(u1), name: "T1", type: "Tramway")
l2 = Line.create!(unit_id: Unit.find(u1), name: "T2", type: "Tramway")

#2 user employee
employee_1 = User.create!(first_name: "Joe", last_name: "Rista", unit_id: Unit.find(u1), email: "employee_1", matricule: 1234, password: 1234 )
employee_2 = User.create!(first_name: "Jacky", last_name: "Bonvita", unit_id: Unit.find(u1), email: "employee_2", matricule: 5678, password: 1234 )

#1 user manager
manager = User.create!(first_name: "Michelle", last_name: "Obama", unit_id: Unit.find(u1), email: "manager", matricule: 23445, manager: true )

#2 shifts en-cours (demande user 1)
shift1 = Shift.create!(
  date: Date.today,
  line_id: Line.find(l1)
  hour_start: Time.new(2020,9,15,7,5,0).strftime("%H:%M"),
  hour_end: Time.new(2020,9,15,16,5,0).strftime("%H:%M"),
  wordking_hours: 25200, # 7h = 25200 seconds -- SECONDS ?
  user_id: User.find(employee_1)
)

shift2 = Shift.create!(
  date: Date.today,
  line_id: Line.find(l1)
  hour_start: Time.new(2020,10,11,11,35,0).strftime("%H:%M"),
  hour_end: Time.new(2020,10,11,20,15,0).strftime("%H:%M"),
  wordking_hours: 22000, # 7h = 22000 seconds -- SECONDS ?
  user_id: User.find(employee_1)
)
#1 shift reponse
shift3 = Shift.create!(
  date: Date.today,
  line_id: Line.find(l2)
  hour_start: Time.new(2020,9,18,9,35,0).strftime("%H:%M"),
  hour_end: Time.new(2020,9,18,16,15,0).strftime("%H:%M"),
  wordking_hours: 22000, # 7h = 22000 seconds -- SECONDS ?
  user_id: User.find(employee_2)
)

shift4 = Shift.create!(
  date: Date.today,
  line_id: Line.find(l1)
  hour_start: Time.new(2020,8,8,11,35,0).strftime("%H:%M"),
  hour_end: Time.new(2020,8,8,20,15,0).strftime("%H:%M"),
  wordking_hours: 22000, # 7h = 22000 seconds -- SECONDS ?
  user_id: User.find(employee_1)
)
#1 shift reponse
shift5 = Shift.create!(
  date: Date.today,
  line_id: Line.find(l2)
  hour_start: Time.new(2020,9,18,9,35,0).strftime("%H:%M"),
  hour_end: Time.new(2020,9,18,16,15,0).strftime("%H:%M"),
  wordking_hours: 22000, # 7h = 22000 seconds -- SECONDS ?
  user_id: User.find(employee_2)

#1 exchange sans reponse
exchange1 = Exchange.create(
  shift_owner_id: Shift.find(shift1),
  shift_answer_id: nil,
  accepted_owner: nil,
  accepted_manager: nil
)
#1 exchange avec une reponse
exchange2 = Exchange.create(
  shift_owner_id: Shift.find(shift2),
  shift_answer_id: Shift.find(shift3),
  accepted_owner: nil,
  accepted_manager: nil
)

#1 exchange avec une reponse acceptee par le owner
exchange2 = Exchange.create(
  shift_owner_id: Shift.find(shift4),
  shift_answer_id: Shift.find(shift5),
  accepted_owner: true,
  accepted_manager: nil
)
