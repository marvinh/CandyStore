# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Shop.create([{name: 'FirstShop'},{name: 'JD Candies'}, {name: 'Sierra Candies'}])
Candy.create([{name: 'Hershey', shop_id: 1},{name: 'Gum', shop_id: 1},{name: '100 Grand', shop_id: 1}])
Candy.create([{name: 'Jolly Rancher', shop_id: 2},{name: 'Gum', shop_id: 2},{name: 'Starburst', shop_id: 2}])
Candy.create([{name: 'Twizzlers', shop_id: 3},{name: 'Gum', shop_id: 3},{name: 'Starburst', shop_id: 3}])
Shelf.create([{shop_id: 1},{shop_id: 1},{shop_id: 2},{shop_id: 3},{shop_id: 3}])
Stock.create([{candy_id: 1, shelf_id: 1, quantity: 7},{candy_id: 2, shelf_id: 1, quantity: 2}])
