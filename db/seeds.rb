puts ".... SEED STARTING"

puts ".... DESTROY ALL"
Exchange.destroy_all
Shift.destroy_all
User.destroy_all
Line.destroy_all
Unit.destroy_all

puts ".... CREATE UNITS"
#2 units
saint_priest = Unit.create!(name: "Dépot de Saint-Priest - Tramway")
meyzieu = Unit.create!(name: "Dépot de Meyzieu- Tramway")

puts ".... CREATE LINES"
#2 lines
l1 = Line.create!(unit: saint_priest, name: "T1", transport_type: "Tramway")
l2 = Line.create!(unit: saint_priest, name: "T2", transport_type: "Tramway")
l3 = Line.create!(unit: saint_priest, name: "T5", transport_type: "Tramway")
l4 = Line.create!(unit: saint_priest, name: "T6", transport_type: "Tramway")

lines = [l1, l2, l3, l4]

puts ".... CREATE USERS"
#2 user employee
f_name_femme = %w[julie esther eujénie magalie justine flore clara nadège leslie]
f_name_homme = %w[achille andré pierre arpène daniel félix léon charles jules nicolas francois]
l_name = %w[ango Aronax bodonor charlie maolssene melanchon birotto brazier grandville grandin picard ricard moncornet duquichot mendosa]
employee_0 = User.create!(first_name: f_name_femme.sample.capitalize, last_name: l_name[0].capitalize, unit: saint_priest, email: "employee_0@gmail.com", matricule: rand(10000..30000), password: 123456, image: "f1.jpg" )

employee_1 = User.create!(first_name: f_name_femme.sample.capitalize, last_name: l_name[1].capitalize, unit: saint_priest, email: "employee_1@gmail.com", matricule: rand(10000..30000), password: 123456, image: "f2.jpg" )
employee_2 = User.create!(first_name: f_name_femme.sample.capitalize, last_name: l_name[2].capitalize, unit: saint_priest, email: "employee_2@gmail.com", matricule: rand(10000..30000), password: 123456, image: "f3.jpg" )
employee_3 = User.create!(first_name: f_name_femme.sample.capitalize, last_name: l_name[3].capitalize, unit: saint_priest, email: "employee_3@gmail.com", matricule: rand(10000..30000), password: 123456, image: "f4.jpg" )
employee_4 = User.create!(first_name: f_name_femme.sample.capitalize, last_name: l_name[4].capitalize, unit: saint_priest, email: "employee_4@gmail.com", matricule: rand(10000..30000), password: 123456, image: "f5.jpg" )
employee_5 = User.create!(first_name: f_name_femme.sample.capitalize, last_name: l_name[5].capitalize, unit: saint_priest, email: "employee_5@gmail.com", matricule: rand(10000..30000), password: 123456, image: "f6.jpg" )
employee_6 = User.create!(first_name: f_name_femme.sample.capitalize, last_name: l_name[6].capitalize, unit: saint_priest, email: "employee_6@gmail.com", matricule: rand(10000..30000), password: 123456, image: "f7.jpg" )
employee_7 = User.create!(first_name: f_name_homme.sample.capitalize, last_name: l_name[7].capitalize, unit: saint_priest, email: "employee_7@gmail.com", matricule: rand(10000..30000), password: 123456, image: "m1.jpg" )
employee_8 = User.create!(first_name: f_name_homme.sample.capitalize, last_name: l_name[8].capitalize, unit: saint_priest, email: "employee_8@gmail.com", matricule: rand(10000..30000), password: 123456, image: "m2.jpg" )
employee_9 = User.create!(first_name: f_name_homme.sample.capitalize, last_name: l_name[9].capitalize, unit: saint_priest, email: "employee_9@gmail.com", matricule: rand(10000..30000), password: 123456, image: "m3.jpg" )
employee_10 = User.create!(first_name: f_name_homme.sample.capitalize, last_name: l_name[10].capitalize, unit: saint_priest, email: "employee_10@gmail.com", matricule: rand(10000..30000), password: 123456, image: "m4.jpg" )
employee_11 = User.create!(first_name: f_name_homme.sample.capitalize, last_name: l_name[11].capitalize, unit: saint_priest, email: "employee_11@gmail.com", matricule: rand(10000..30000), password: 123456, image: "m5.jpg" )
employee_12 = User.create!(first_name: f_name_homme.sample.capitalize, last_name: l_name[12].capitalize, unit: saint_priest, email: "employee_12@gmail.com", matricule: rand(10000..30000), password: 123456, image: "m6.jpg" )
employee_13 = User.create!(first_name: f_name_homme.sample.capitalize, last_name: l_name[13].capitalize, unit: saint_priest, email: "employee_13@gmail.com", matricule: rand(10000..30000), password: 123456, image: "m7.jpg" )
employee_14 = User.create!(first_name: f_name_homme.sample.capitalize, last_name: l_name[14].capitalize, unit: saint_priest, email: "employee_14@gmail.com", matricule: rand(10000..30000), password: 123456, image: "m8.jpg" )

# EMPLOYE PROTAGONISTE
donald = User.create!(first_name: "Richard", last_name: "Mendosa", unit: saint_priest, email: "richard@gmail.com", matricule: rand(10000..30000), password: 123456, image: "richard.jpg" )
didier = User.create!(first_name: "Thibault", last_name: "Dautremer", unit: saint_priest, email: "thibault@gmail.com", matricule: rand(10000..30000), password: 123456, image: "tibo.jpg" )

# MANAGER
kim = User.create!(first_name: "Kim", last_name: "Jong-un", unit: saint_priest, email: "kim@gmail.com", matricule: rand(10000..30000), password: 123456, image: "f1.jpg", manager: true )


dates = ["2021.03.27", "2021.03.28", "2021.03.29", "2021.03.30", "2021.03.01", "2021.03.12", "2021.04.04", "2021.04.04", "2021.04.05", "2021.04.06","2021.04.07","2021.04.08","2021.04.09","2021.04.10","2021.04.11"]

# manager_1 = User.create!(first_name: "Joe", last_name: "Rista", unit: u1, email: "employee_1@gmail.com", matricule: 1234, password: 123456, image: "raoni.jpg" )

employees = [employee_0, employee_1, employee_2, employee_3, employee_4, employee_5, employee_6, employee_7, employee_8, employee_9, employee_10, employee_11, employee_12, employee_13, employee_14]


# #1 user manager
# manager = User.create!(first_name: "Michelle", last_name: "Obama", unit: u1, email: "manager@gmail.com", matricule: 23445, manager: true, password: 123456 )


puts ".... CREATE SHIFTS"

# 15.times do
#   h = rand(3..17)
#   min = %w[5 10 15 20 25 30 35 40 45 50 55]
#   Shift.create!(
#     date: dates.sample.to_date,
#     line: lines.sample,
#     hour_start: Time.new(2021,9,15,h,min.sample.to_i,0).strftime("%H:%M"),
#     hour_end: Time.new(2021,9,15,(h+rand(5..7)),min.sample.to_i,0).strftime("%H:%M"),
#     working_hours: rand(5..7),
#     working_minutes: min.sample.to_i,
#     user: employees.sample
#   )
# end

shift0 =   Shift.create!(
  date: dates[0],
  line: lines.sample,
  hour_start: Time.zone.local(2021, 4, 12, 14, 0).strftime("%H:%M"),
  hour_end: Time.zone.local(2011, 4, 12, 19, 0).strftime("%H:%M"),
  working_hours: 7,
  working_minutes: 55,
  user: employee_0
)

shift1 =   Shift.create!(
  date: dates[1],
  line: lines.sample,
  hour_start: Time.new(2021,9,15,5,23,0).strftime("%H:%M"),
  hour_end: Time.new(2021,9,15,13,4,0).strftime("%H:%M"),
  working_hours: 7,
  working_minutes: 40,
  user: employee_1
)

shift2 =   Shift.create!(
  date: dates[2],
  line: lines.sample,
  hour_start: Time.new(2021,9,15,11,7,0).strftime("%H:%M"),
  hour_end: Time.new(2021,9,15,19,5,0).strftime("%H:%M"),
  working_hours: 7,
  working_minutes: 55,
  user: employee_2
)

shift3 =   Shift.create!(
  date: dates[3],
  line: lines.sample,
  hour_start: Time.new(2021,9,15,5,23,0).strftime("%H:%M"),
  hour_end: Time.new(2021,9,15,10,33,0).strftime("%H:%M"),
  working_hours: 5,
  working_minutes: 10,
  user: employee_3
)
shift4 =   Shift.create!(
  date: dates[4],
  line: lines.sample,
  hour_start: Time.new(2021,9,15,14,25,0).strftime("%H:%M"),
  hour_end: Time.new(2021,9,15,21,39,0).strftime("%H:%M"),
  working_hours: 7,
  working_minutes: 15,
  user: employee_4
)
shift5 =   Shift.create!(
  date: dates[5],
  line: lines.sample,
  hour_start: Time.new(2021,9,15,18,25,0).strftime("%H:%M"),
  hour_end: Time.new(2021,9,15,23,2,0).strftime("%H:%M"),
  working_hours: 4,
  working_minutes: 40,
  user: employee_5
)
shift6 =   Shift.create!(
  date: dates[6],
  line: lines.sample,
  hour_start: Time.new(2021,9,15,16,2,0).strftime("%H:%M"),
  hour_end: Time.new(2021,9,15,23,25,0).strftime("%H:%M"),
  working_hours: 7,
  working_minutes: 25,
  user: employee_6
)
shift7 =   Shift.create!(
  date: dates[7],
  line: lines.sample,
  hour_start: Time.new(2021,9,15,8,36,0).strftime("%H:%M"),
  hour_end: Time.new(2021,9,15,15,05,0).strftime("%H:%M"),
  working_hours: 6,
  working_minutes: 30,
  user: employee_7
)
shift8 =   Shift.create!(
  date: dates[8],
  line: lines.sample,
  hour_start: Time.new(2021,9,15,15,8,0).strftime("%H:%M"),
  hour_end: Time.new(2021,9,15,22,25,0).strftime("%H:%M"),
  working_hours: 7,
  working_minutes: 15,
  user: employee_8
)
shift9 =   Shift.create!(
  date: dates[9],
  line: lines.sample,
  hour_start: Time.new(2021,9,15,7,25,0).strftime("%H:%M"),
  hour_end: Time.new(2021,9,15,14,25,0).strftime("%H:%M"),
  working_hours: 7,
  working_minutes: 0,
  user: employee_9
)
shift10 =   Shift.create!(
  date: dates[10],
  line: lines.sample,
  hour_start: Time.new(2021,9,15,4,58,0).strftime("%H:%M"),
  hour_end: Time.new(2021,9,15,12,5,0).strftime("%H:%M"),
  working_hours: 7,
  working_minutes: 10,
  user: employee_10
)
shift11 =   Shift.create!(
  date: dates[11],
  line: lines.sample,
  hour_start: Time.new(2021,9,15,8,54,0).strftime("%H:%M"),
  hour_end: Time.new(2021,9,15,17,41,0).strftime("%H:%M"),
  working_hours: 8,
  working_minutes: 45,
  user: employee_11
)
shift12 =   Shift.create!(
  date: dates[12],
  line: lines.sample,
  hour_start: Time.new(2021,9,15,9,52,0).strftime("%H:%M"),
  hour_end: Time.new(2021,9,15,18,1,0).strftime("%H:%M"),
  working_hours: 8,
  working_minutes: 10,
  user: employee_12
)
shift13 =   Shift.create!(
  date: dates[13],
  line: lines.sample,
  hour_start: Time.new(2021,9,15,7,16,0).strftime("%H:%M"),
  hour_end: Time.new(2021,9,15,16,22,0).strftime("%H:%M"),
  working_hours: 9,
  working_minutes: 5,
  user: employee_13
)
shift14 =   Shift.create!(
  date: dates[14],
  line: lines.sample,
  hour_start: Time.new(2021,9,15,15,28,0).strftime("%H:%M"),
  hour_end: Time.new(2021,9,15,21,32,0).strftime("%H:%M"),
  working_hours: 6,
  working_minutes: 5,
  user: employee_14
)

# shiftdonald1 = Shift.create!(
#   date: "2021.06.30".to_date,
#   line: lines.sample,
#   hour_start: Time.new(2021,9,15,7,25,0).strftime("%H:%M"),
#   hour_end: Time.new(2021,9,15,14,52,0).strftime("%H:%M"),
#   working_hours: 7,
#   working_minutes: 25,
#   user: donald
# )

# shiftdonald2 = Shift.create!(
#   date: "2021.07.04".to_date,
#   line: lines.sample,
#   hour_start: Time.new(2021,9,15,14,56,0).strftime("%H:%M"),
#   hour_end: Time.new(2021,9,15,20,45,0).strftime("%H:%M"),
#   working_hours: 5,
#   working_minutes: 50,
#   user: donald
# )

# shiftdonald3 = Shift.create!(
#   date: "2021.07.05".to_date,
#   line: lines.sample,
#   hour_start: Time.new(2021,9,15,5,26,0).strftime("%H:%M"),
#   hour_end: Time.new(2021,9,15,12,12,0).strftime("%H:%M"),
#   working_hours: 6,
#   working_minutes: 45,
#   user: donald
# )

shiftdonald4 = Shift.create!(
  date: "2021.07.09".to_date,
  line: lines.sample,
  hour_start: Time.new(2021,9,15,11,25,0).strftime("%H:%M"),
  hour_end: Time.new(2021,9,15,16,14,0).strftime("%H:%M"),
  working_hours: 4,
  working_minutes: 50,
  user: donald
)

shiftdider1 = Shift.create!(
  date: "2021.07.13".to_date,
  line: lines.sample,
  hour_start: Time.new(2021,9,15,8,25,0).strftime("%H:%M"),
  hour_end: Time.new(2021,9,15,16,28,0).strftime("%H:%M"),
  working_hours: 8,
  working_minutes: 5,
  user: didier
)

shiftdider2 = Shift.create!(
  date: "2021.07.16".to_date,
  line: lines.sample,
  hour_start: Time.new(2021,9,15,16,52,0).strftime("%H:%M"),
  hour_end: Time.new(2021,9,15,22,8,0).strftime("%H:%M"),
  working_hours: 5,
  working_minutes: 15,
  user: didier
)
puts ".... CREATE EXCHANGES "

# 2 echange donald proprio accepté

# exchangedonald_pending_manager1 = Exchange.create(
#   shift_owner: shiftdonald1,
#   shift_answer: shift6,
#   accepted_owner: true,
#   accepted_manager: nil
# )

# exchangedonald_pending_manager2 = Exchange.create(
#   shift_owner: shiftdonald2,
#   shift_answer: shift7,
#   accepted_owner: true,
#   accepted_manager: nil
# )

# exchangedonald_pending_user1 = Exchange.create(
#   shift_owner: shiftdonald3,
#   shift_answer: shift9,
#   accepted_owner: nil,
#   accepted_manager: nil
# )

exchangedonald_pending_user2 = Exchange.create(
  shift_owner: shiftdonald4,
  shift_answer: shift14,
  accepted_owner: nil,
  accepted_manager: nil
)

exchangedonald_pending_user3 = Exchange.create(
  shift_owner: shiftdonald4,
  shift_answer: shift12,
  accepted_owner: nil,
  accepted_manager: nil
)


# exchangedider_pending_user1 = Exchange.create(
#   shift_owner: shift11,
#   shift_answer: shiftdider1,
#   accepted_owner: nil,
#   accepted_manager: nil
# )

exchangeforkim1 = Exchange.create(
  shift_owner: shift5,
  shift_answer: shift3,
  accepted_owner: true,
  accepted_manager: nil
)


puts ".... CUSTOM SEED OK"


# #2 exchange avec une reponse acceptee par le owner
# exchange3 = Exchange.create(
#   shift_owner_id: shift4,
#   shift_answer_id: shift5,
#   accepted_owner: true,
#   accepted_manager: nil
# )

# exchange4 = Exchange.create(
#   shift_owner_id: shift6.id,
#   shift_answer_id: shift7.id,
#   accepted_owner: true,
#   accepted_manager: nil
# )

# #3 exchange avec une reponse acceptee par le manager
# exchange5 = Exchange.create(
#   shift_owner_id: shift4.id,
#   shift_answer_id: shift5.id,
#   accepted_owner: true,
#   accepted_manager: true
# )

# puts ".... SEED OK ...."


# puts ".... START CUSTOM SEED"


# Exchange.destroy_all
# Shift.destroy_all


# joe = User.find_by(first_name: 'Joe')
# jacky = User.find_by(first_name: 'Jacky')
# toto = User.find_by(first_name: 'Toto')
# titi = User.find_by(first_name: 'Titi')

# l1 = Line.find_by(name: "T1")
# l2 = Line.find_by(name: "T2")
# l3 = Line.find_by(name: "T3")
# l4 = Line.find_by(name: "T4")



# Shift.create!(
#   date: Date.today,
#   line: l1,
#   hour_start: Time.new(2021,9,15,7,5,0).strftime("%H:%M"),
#   hour_end: Time.new(2021,9,15,16,5,0).strftime("%H:%M"),
#   working_hours: 6,
#   working_minutes: 25,
#   user: joe
# )

# Shift.create!(
#   date: Date.today,
#   line: l3,
#   hour_start: Time.new(2021,9,15,7,5,0).strftime("%H:%M"),
#   hour_end: Time.new(2021,9,15,16,5,0).strftime("%H:%M"),
#   working_hours: 6,
#   working_minutes: 25,
#   user: toto
# )

# Shift.create!(
#   date: Date.yesterday,
#   line: l1,
#   hour_start: Time.new(2021,9,15,7,5,0).strftime("%H:%M"),
#   hour_end: Time.new(2021,9,15,16,5,0).strftime("%H:%M"),
#   working_hours: 6,
#   working_minutes: 25,
#   user: jacky
# )

# Shift.create!(
#   date: Date.today,
#   line: l1,
#   hour_start: Time.new(2021,9,15,7,5,0).strftime("%H:%M"),
#   hour_end: Time.new(2021,9,15,16,5,0).strftime("%H:%M"),
#   working_hours: 6,
#   working_minutes: 25,
#   user: jacky
# )

# ##############################

# shift_without_exchange = Shift.create!(
#   date: Date.tomorrow,
#   line: l1,
#   hour_start: Time.new(2021,9,15,7,5,0).strftime("%H:%M"),
#   hour_end: Time.new(2021,9,15,16,5,0).strftime("%H:%M"),
#   working_hours: 6,
#   working_minutes: 25,
#   user: jacky
# )


# shift_with_exchange1 = Shift.create!(
#   date: 2.days.from_now,
#   line: l1,
#   hour_start: Time.new(2021,9,15,7,5,0).strftime("%H:%M"),
#   hour_end: Time.new(2021,9,15,16,5,0).strftime("%H:%M"),
#   working_hours: 6,
#   working_minutes: 25,
#   user: joe
# )


# shift_with_exchange2 = Shift.create!(
#   date: 2.days.from_now,
#   line: l2,
#   hour_start: Time.new(2021,9,15,7,5,0).strftime("%H:%M"),
#   hour_end: Time.new(2021,9,15,16,5,0).strftime("%H:%M"),
#   working_hours: 6,
#   working_minutes: 25,
#   user: jacky
# )

# shift_with_exchange3 = Shift.create!(
#   date: 3.days.from_now,
#   line: l3,
#   hour_start: Time.new(2021,9,15,7,5,0).strftime("%H:%M"),
#   hour_end: Time.new(2021,9,15,16,5,0).strftime("%H:%M"),
#   working_hours: 6,
#   working_minutes: 25,
#   user: jacky
# )

# exchange1 = Exchange.create!(
#   shift_owner: shift_with_exchange1,
#   shift_answer: shift_with_exchange2,
#   accepted_owner: true,
#   accepted_manager: nil
# )


# shift_with_exchange3 = Shift.create!(
#   date: 3.days.from_now,
#   line: l1,
#   hour_start: Time.new(2021,9,15,7,5,0).strftime("%H:%M"),
#   hour_end: Time.new(2021,9,15,16,5,0).strftime("%H:%M"),
#   working_hours: 6,
#   working_minutes: 25,
#   user: joe
# )


# shift_with_exchange4 = Shift.create!(
#   date: 4.days.from_now,
#   line: l2,
#   hour_start: Time.new(2021,9,15,7,5,0).strftime("%H:%M"),
#   hour_end: Time.new(2021,9,15,16,5,0).strftime("%H:%M"),
#   working_hours: 6,
#   working_minutes: 25,
#   user: jacky
# )

# shift_with_exchange5 = Shift.create!(
#   date: 4.days.from_now,
#   line: l4,
#   hour_start: Time.new(2021,9,15,7,5,0).strftime("%H:%M"),
#   hour_end: Time.new(2021,9,15,16,5,0).strftime("%H:%M"),
#   working_hours: 6,
#   working_minutes: 25,
#   user: titi
# )


# exchange2 = Exchange.create!(
#   shift_owner: shift_with_exchange4,
#   shift_answer: shift_with_exchange3,
#   accepted_owner: true,
#   accepted_manager: nil
# )

# exchange3 = Exchange.create!(
#   shift_owner: shift_with_exchange4,
#   shift_answer: shift_with_exchange5,
#   accepted_owner: nil,
#   accepted_manager: nil
# )



# shift_with_exchange6 = Shift.create!(
#   date: 5.days.from_now,
#   line: l2,
#   hour_start: Time.new(2021,9,15,7,5,0).strftime("%H:%M"),
#   hour_end: Time.new(2021,9,15,16,5,0).strftime("%H:%M"),
#   working_hours: 6,
#   working_minutes: 25,
#   user: jacky
# )

# shift_with_exchange7 = Shift.create!(
#   date: 5.days.from_now,
#   line: l4,
#   hour_start: Time.new(2021,9,15,7,5,0).strftime("%H:%M"),
#   hour_end: Time.new(2021,9,15,16,5,0).strftime("%H:%M"),
#   working_hours: 6,
#   working_minutes: 25,
#   user: titi
# )


# shift_with_exchange8 = Shift.create!(
#   date: 6.days.from_now,
#   line: l4,
#   hour_start: Time.new(2021,9,15,7,5,0).strftime("%H:%M"),
#   hour_end: Time.new(2021,9,15,16,5,0).strftime("%H:%M"),
#   working_hours: 6,
#   working_minutes: 25,
#   user: titi
# )

# shift_with_exchange9 = Shift.create!(
#   date: 7.days.from_now,
#   line: l2,
#   hour_start: Time.new(2021,9,15,7,5,0).strftime("%H:%M"),
#   hour_end: Time.new(2021,9,15,16,5,0).strftime("%H:%M"),
#   working_hours: 6,
#   working_minutes: 25,
#   user: jacky
# )


# shift_with_exchange10 = Shift.create!(
#   date: 8.days.from_now,
#   line: l4,
#   hour_start: Time.new(2021,9,15,7,5,0).strftime("%H:%M"),
#   hour_end: Time.new(2021,9,15,16,5,0).strftime("%H:%M"),
#   working_hours: 6,
#   working_minutes: 25,
#   user: titi
# )

# shift_with_exchange11 = Shift.create!(
#   date: 8.days.from_now,
#   line: l2,
#   hour_start: Time.new(2021,9,15,7,5,0).strftime("%H:%M"),
#   hour_end: Time.new(2021,9,15,16,5,0).strftime("%H:%M"),
#   working_hours: 6,
#   working_minutes: 25,
#   user: jacky
# )


# shift_with_exchange12 = Shift.create!(
#   date: 9.days.from_now,
#   line: l4,
#   hour_start: Time.new(2021,9,15,7,5,0).strftime("%H:%M"),
#   hour_end: Time.new(2021,9,15,16,5,0).strftime("%H:%M"),
#   working_hours: 6,
#   working_minutes: 25,
#   user: titi
# )

# shift_with_exchange13 = Shift.create!(
#   date: 10.days.from_now,
#   line: l1,
#   hour_start: Time.new(2021,9,15,7,5,0).strftime("%H:%M"),
#   hour_end: Time.new(2021,9,15,16,5,0).strftime("%H:%M"),
#   working_hours: 6,
#   working_minutes: 25,
#   user: titi
# )

# exchange3 = Exchange.create!(
#   shift_owner: shift_with_exchange6,
#   shift_answer: shift_with_exchange4,
#   accepted_owner: nil,
#   accepted_manager: nil
# )


# exchange3 = Exchange.create!(
#   shift_owner: shift_with_exchange6,
#   shift_answer: shift_with_exchange7,
#   accepted_owner: true,
#   accepted_manager: nil
# )

# exchange4 = Exchange.create!(
#   shift_owner: shift_with_exchange9,
#   shift_answer: shift_with_exchange10,
#   accepted_owner: true,
#   accepted_manager: true
# )

# exchange10 = Exchange.create!(
#   shift_owner: shift_with_exchange11,
#   shift_answer: shift_with_exchange12,
#   accepted_owner: nil,
#   accepted_manager: nil
# )

# exchange10 = Exchange.create!(
#   shift_owner: shift_with_exchange11,
#   shift_answer: shift_with_exchange13,
#   accepted_owner: nil,
#   accepted_manager: nil
# )


# puts ".... CUSTOM SEED OK"
