ap "cocuo"

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


exchange3 = Exchange.create!(
  shift_owner: shift_with_exchange6,
  shift_answer: shift_with_exchange7,
  accepted_owner: nil,
  accepted_manager: nil
)


exchange3 = Exchange.create!(
  shift_owner: shift_with_exchange6,
  shift_answer: shift_with_exchange8,
  accepted_owner: nil,
  accepted_manager: nil
)






