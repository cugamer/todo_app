user = User.create(name:                    "James Bond",
                   email:                   "007@mi6.com",
                   password:                "moneypenny",
                   password_confirmation:   "moneypenny")

10.times do |n|
  list = user.lists.create(name: "list_#{n}")
  10.times do |m|
    list.tasks.create(name: "task_#{m}")
  end
end