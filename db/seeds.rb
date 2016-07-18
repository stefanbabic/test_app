User.create!(name:  "Fake User",
             email: "example@test.org",
             password:              "testing",
             password_confirmation: "testing",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@test.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end