# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#Role.create(role_code: 1,
#           role_name: 'super_admin')
#Role.create(role_code: 2,
#           role_name: 'admin')

Admin.create(first_name: 'Oleg',
             last_name: 'Koval',
             email: 'ovk',
             password: '123456',
             password_confirmation: '123456',
             role_code: 1)

Admin.create(first_name: 'Andrey',
             last_name: 'Koval',
             email: 'admin1',
             password: 'admin1',
             password_confirmation: 'admin1',
             role_code: 2)

Admin.create(first_name: 'Alex',
             last_name: 'Koval',
             email: 'admin2',
             password: 'admin2',
             password_confirmation: 'admin2',
             role_code: 2)

User.create(first_name: 'Olesya',
             last_name: 'Koval',
             email: 'user1',
             password: 'user1',
             password_confirmation: 'user1',
             role_code: 3)

User.create(first_name: 'Olga',
             last_name: 'Koval',
             email: 'user2',
             password: 'user2',
             password_confirmation: 'user2',
             role_code: 3)

User.create(first_name: 'Irina',
             last_name: 'Koval',
             email: 'user3',
             password: 'user3',
             password_confirmation: 'user3',
             role_code: 3)
