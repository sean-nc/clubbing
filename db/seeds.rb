Faker::Config.locale = 'en-CA'

user = User.create(email: "sean@email.com",
                   password: "password",
                   password_confirmation: "password",
                   admin: true)

user.create_profile(username: "sean",
                    first_name: "Sean",
                    last_name: "Cordes",
                    gender: "Male",
                    date_of_birth: Date.new(1990, 2, 11))

venue = Venue.create(name: "EFS",
                     location: "Toronto",
                     age: 19,
                     email: "efs@email.com",
                     phone: "(416) 888-9212",
                     capacity: 300,
                     music: "Hip Hop",
                     dress_code: "Casual",
                     website: "https://website.com",
                     category: "Club",
                     owner_id: user.id)

10.times do |i|
  user = User.create(email: "user#{i}@email.com",
                     password: "password",
                     password_confirmation: "password")

  if i.even?
    gender = "Male"
    first_name = Faker::Name.male_first_name
  else
    gender = "Female"
    first_name = Faker::Name.female_first_name
  end

  last_name = Faker::Name.last_name
  birth_date = Faker::Date.between(35.years.ago, 19.years.ago)

  user.create_profile(username: "user#{i}",
                      first_name: first_name,
                      last_name: last_name,
                      gender: gender,
                      date_of_birth: birth_date)

  user.add_role(:employee, venue) if i.even?
end

user = User.find(2)

10.times do |n|
  venue = Venue.create(name: "venue#{n}",
                       location: "Toronto",
                       age: 19,
                       email: "venue#{n}@email.com",
                       phone: Faker::PhoneNumber.cell_phone,
                       capacity: (200..400),
                       music: Faker::Music.genre,
                       dress_code: "Casual",
                       website: "https://website#{n}.com",
                       category: "Club",
                       owner_id: user.id)
end
