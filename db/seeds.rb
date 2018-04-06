# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.new
user.email = 'admin@admin.com'
user.encrypted_password = ''
user.password = 'admin'
user.first_name = 'admin'
user.last_name = 'user'
user.username = 'admin'
user.role = 'admin'
user.disabled = false
user.save!

product=Product.new
product.name = 'YAMAHA CS40 STUDENT CLASSICAL GUITAR'
product.price = 165.00
product.quantity = 10
product.description = 'YAMAHA CS40 STUDENT CLASSICAL GUITAR'
product.category = 'Acoustic'
product.brand = 'YAMAHA'
product.visible = true
product.image = Rails.root.join('app', 'assets', 'images', 'product_1.jpg').open
product.save!

product=Product.new
product.name = 'FENDER CD-60S ACOUSTIC GUITAR - NATURAL'
product.price = 382.00
product.quantity = 20
product.description = 'FENDER CD-60S ACOUSTIC GUITAR - NATURAL'
product.category = 'Acoustic'
product.brand = 'FENDER'
product.visible = true
product.image = Rails.root.join('app', 'assets', 'images', 'product_1.jpg').open
product.save!
