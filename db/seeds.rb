u = User.create(email: "email@email.com", password: "password",
                password_confirmation: "password", username: "sean",
                first_name: "Sean", last_name: "Cordes", gender: "Male", date_of_birth: Date.new(1990, 2, 11))

u.add_role(:admin)

10.times do |n|
  if n.even?
    gender = "Male"
    first_name = Faker::Name.male_first_name
  else
    gender = "Female"
    first_name = Faker::Name.female_first_name
  end

  last_name = Faker::Name.last_name
  birth_date = Faker::Date.between(35.years.ago, 19.years.ago)

  User.create(email: "email#{n}@email.com",
              password: "password", password_confirmation: "password",
              username: "user#{n}",
              first_name: first_name,
              last_name: last_name,
              gender: gender,
              date_of_birth: birth_date)
end

u = User.find(2)
u2 = User.find(3)

10.times do |n|
  name = Faker::Company.name
  phone = Faker::PhoneNumber.cell_phone
  capacity = rand(100..400)
  music = Faker::Music.genre
  dress_code = ["Casual", "Dress to Impress", "Formal", "Business Casual"].sample
  category = ["Bar", "Club", "Club/Bar"].sample

  venue = Venue.create(name: name,
                       location: "Toronto",
                       age: 19,
                       email: "business#{n}@email.com",
                       phone: phone,
                       capacity: capacity,
                       music: music,
                       dress_code: dress_code,
                       website: "https://biz#{n}.com",
                       category: category)

  u.add_role(:admin, venue)
  u.add_role(:employee, venue)

  5.times do |num|
    name = "#{venue.name} - Event #{num}"
    start_time = DateTime.now + (num*24.hours)
    end_time = start_time + 6.hours
    description = Faker::HowIMetYourMother.quote

    event = Event.create(name: name,
                         description: description,
                         start_time: start_time,
                         end_time: end_time,
                         venue_id: venue.id)

    r_number = [1000, 2000, 3000, 4000, 5000].sample

    3.times do |n|
      limit = rand(10..20)
      expiration = event.end_time

      if n == 0
        name = "Cover"
        description = "This gets you entry into the club."
        price = r_number
      elsif n == 1
        name = "Early Bird"
        description = "This gets you entry into the club."
        price = r_number/2
        expiration = expiration - 2.hours
      else
        name = "Fast Pass"
        description = "This lets you cut the line."
        price = r_number*2
      end

      TicketOption.create(name: name,
                          description: description,
                          price: price,
                          limit: limit,
                          expiration: expiration,
                          event_id: event.id)
    end
  end
end
