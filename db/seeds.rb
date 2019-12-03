
Cat.destroy_all
User.destroy_all

user1 = User.create(first_name: "Bob", last_name: "Jones")
user2 = User.create(first_name: "Billy", last_name: "Joel")

Cat.create(name: "Luna", age: 1, user: user1)
Cat.create(name: "Autumn", age: 3, user: user2)
Cat.create(name: "Granola", age: 7, user: user1)
Cat.create(name: "Meeko", age: 5, user: user1)
Cat.create(name: "Lucy", age: 9, user: user1)
Cat.create(name: "Monkey", age: 12, user: user2)