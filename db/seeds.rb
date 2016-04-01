user = User.create(name:                    "Sample",
                   email:                   "sample@sample.com",
                   password:                "password",
                   password_confirmation:   "password")

User.create(name:                   "Sterling Archer",
            email:                  "duchess@secret.gov",
            password:               "ocelot",
            password_confirmation:  "ocelot")

30.times do |n|
  list = user.lists.create(name: "list_#{n + 1}")
  30.times do |m|
    list.tasks.create(name: "task_#{m + 1}")
  end
end
