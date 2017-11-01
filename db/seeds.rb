def rand_date
  t = Time.now
  d = Date.new(t.year, 1, 1)
  d += rand(360) + 1
  return d
end

def seed_rest_db
  countries_size = Country.all.count
  specialities_size = Speciality.all.count
  print "Добавление национальностей..."
  for i in 0...10
    Nationality.create!(name: "Национальность #{i+1}")
  end
  puts " готово (#{Nationality.all.count})"
  print "Добавление религий..."
  for i in 0...10
    Religion.create!(name: "Религия #{i+1}")
  end
  puts " готово (#{Religion.all.count})"
  print "Добавление удостоверений личности..."
  10.times do
    Passport.create!(serial: (rand(100)+1).to_s, number: (rand(1000000)+1000).to_s)
  end
  puts " готово (#{Passport.all.count})"
  print "Добавление национальных праздников..."
  for i in 0...10
    NationalHoliday.create!(
      name: "Национальный праздник #{i+1}",
      date: rand_date,
      nationality_id: i+1
    )
  end
  puts " готово (#{NationalHoliday.all.count})"
  print "Добавление религиозных праздников..."
  for i in 0...10
    ReligionHoliday.create!(
      name: "Религиозный праздник #{i+1}",
      date: rand_date,
      religion_id: i+1
    )
  end
  puts " готово (#{ReligionHoliday.all.count})"
  print "Добавление учебных групп..."
  for i in 0...10
    Group.create!(
      name: "Учебная группа #{i+1}",
      speciality_id: rand(specialities_size) + 1
    )
  end
  puts " готово (#{Group.all.count})"
  print "Добавление общежитий..."
  for i in 0...10
    Hostel.create!(
      name: "Общежитие #{i+1}",
      address: "Адрес #{i+1}",
      floors_count: rand(5)+1
    )
  end
  puts " готово (#{Hostel.all.count})"
  print "Добавление этажей..."
  for i in 0...10
    for j in 0...Hostel.where(id: i+1).first.floors_count
      Floor.create!(
        hostel_id: i+1,
        floor_number: j+1,
        rooms_count: rand(10)+1
      )
    end
  end
  puts " готово (#{Floor.all.count})"
  print "Добавление комнат..."
  for i in 1..Floor.all.count
    for j in 1..Floor.where(id: i).first.rooms_count
      Room.create!(
        floor_id: i,
        place_count: 5,
        room_number: "Комната #{Floor.where(id: i).first.hostel.id}.#{Floor.where(id: i).first.floor_number}.#{j}"
      )
    end
  end
  puts " готово (#{Room.all.count})"
  print "Добавление студентов..."
  for i in 0...10
    Student.create!(
      passport_id: i+1,
      ln: "Фамилия #{i+1}",
      fn: "Имя #{i+1}",
      sn: "Отчество #{i+1}",
      sex: [?м,?ж].shuffle.first,
      bday: rand_date,
      country_id: rand(countries_size) + 1,
      nationality_id: i+1,
      religion_id: i+1,
      start_date: d1 = rand_date,
      finish_date: d1 + 10,
      group_id: i+1,
      room_id: rand(Room.all.count) + 1
    )
  end
  puts " готово (#{Student.all.count})"
  print "Добавление направлений на обучение..."
  for i in 0...10
    Referral.create!(
      student_id: i+1,
      referral_number: "Номер #{i+1}",
      date: rand_date,
      speciality_id: rand(specialities_size) + 1,
      payment: rand(1000)+500
    )
  end
  puts " готово (#{Referral.all.count})"
  print "Добавление документов..."
  for i in 0...10
    Document.create!(
      student_id: i+1,
      doc_type: "Тип #{i+1}",
      doc_number: "Номер #{i+1}",
      exp_date: rand_date
    )
  end
  puts " готово (#{Document.all.count})"
  print "Добавление документов об образовании..."
  for i in 0...10
    Education.create!(
      student_id: i+1,
      edu_level: "Уровень образования #{i+1}",
      language: "Язык #{i+1}",
      translation: "Перевод #{i+1}"
    )
  end
  puts " готово (#{Education.all.count})"
end

file = File.open("oksm", "r")
print "Добавление стран по классификатору... "
while true
  arr = []
  begin
    str = file.readline.strip!
    arr = str.split('|')
    arr.insert(1, arr[0]) if arr.size == 4
    Country.create!(short_name: arr[0], long_name: arr[1], alpha2: arr[2], alpha3: arr[3], country_code: arr[4])
  rescue EOFError
    break
  end
end
puts "готово (#{Country.all.count})"
file.close

file = File.open("okso", "r")
print "Добавление специальностей по классификатору... "
section = ""
section_number = 0
group = ""
group_number = 0
subgroup = ""
subgroup_number = ""
while true
  arr = []
  tmp_arr = []
  begin
    str = file.readline.strip!
    if str.include?("Раздел")
      section = str
      section_number += 1
      next
    end
    tmp_arr = str.split("|")
    if tmp_arr[0].size == 1
      group = tmp_arr[1]
      group_number = tmp_arr[0].to_i
      next
    elsif tmp_arr[0].include?("00.00")
      subgroup = tmp_arr[1]
      subgroup_number = tmp_arr[0]
      next
    end
    2.times do
      tmp_arr[0][0] = ""
    end
    Speciality.create!(
    section_number: section_number,
    section_name: section,
    group_number: group_number,
    group_name: group,
    subgroup_number: subgroup_number,
    subgroup_name: subgroup,
    speciality_code: tmp_arr[0],
    name: tmp_arr[1],
    edu_prog_code: tmp_arr[2],
    edu_area_code: tmp_arr[3])
  rescue EOFError
    break
  end
end
puts "готово (#{Speciality.all.count})"
file.close

seed_rest_db
