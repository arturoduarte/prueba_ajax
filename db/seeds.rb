# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.destroy_all
Company.destroy_all
User.destroy_all

20.times do |i|
  Company.create(name: "Ejemplo de Empresa#{i}")
end

30.times do |i|
  User.create(email: "correo#{i}@gmail.com",
  password: "password#{i}")
end


company = Company.all
user = User.all
250.times do
	Comment.create(
		content: Faker::Lorem.sentence(8, false, 0),
    company: company.sample,
    user: user.sample
	)
end




#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?