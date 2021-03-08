@surgery1 = Surgery.create!(title: "Tonsillectomy", day_of_week: "Monday", operating_room_number: "113")
@surgery2 = Surgery.create!(title: "Caesarean Section", day_of_week: "Friday", operating_room_number: "203")
@surgery3 = Surgery.create!(title: "Heart Bypass", day_of_week: "Wednesday", operating_room_number: "105")

@doctor1 = @surgery1.doctors.create!(name: "Meredith Grey", years_experience: 11, university: "Dartmouth")
@doctor2 = @surgery3.doctors.create!(name: "Carmen Daza", years_experience: 20, university: "Yale")
@doctor3 = @surgery2.doctors.create!(name: "Andy Cooper", years_experience: 9, university: "George Mason")
@doctor4 = @surgery2.doctors.create!(name: "Olivia Pope", years_experience: 15, university: "Harvard")
