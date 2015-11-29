user = User.create(name:                    "James Bond",
                   email:                   "007@mi6.com",
                   password:                "moneypenny",
                   password_confirmation:   "moneypenny")

user.create(name:                   "Sterling Archer",
            email:                  "duchess@secret.gov",
            password:               "ocelot",
            password_confirmation:  "ocelot")

30.times do |n|
  list = user.lists.create(name: "list_#{n}")
  30.times do |m|
    list.tasks.create(name: "task_#{m}")
  end
end
