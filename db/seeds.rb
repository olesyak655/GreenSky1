# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#super_admin = Admin.new
#super_admin.first_name = 'Oleg'
#super_admin.last_name = 'Koval'
#super_admin.email = 'ovk655@mail.ru'
#
#password_salt = BCrypt::Engine.generate_salt
#super_admin.password_salt = password_salt
#super_admin.password_hash = BCrypt::Engine.hash_secret('olegkoval655',password_salt)
#super_admin.save

Role.create(role_code: 1,
            role_name: 'super_admin')
Role.create(role_code: 2,
            role_name: 'admin')

Admin.create(first_name: 'Oleg',
             last_name: 'Koval',
             email: 'ovk',
             password: '123456',
             password_confirmation: '123456',
             role_code: 1)

