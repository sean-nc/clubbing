user = User.create(email: "sean@email.com",
                   password: "password",
                   password_confirmation: "password",
                   admin: true)

user.create_profile(first_name: "Sean",
                    last_name: "Cordes",
                    gender: "Male",
                    date_of_birth: Date.new(1990, 2, 11))

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

  user.create_profile(first_name: first_name,
                      last_name: last_name,
                      gender: gender,
                      date_of_birth: birth_date)
end
