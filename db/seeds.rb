User.create!(
                    email: "example@hogehoge.org",
                 password: "hogehoge",
    password_confirmation: "hogehoge",
                     name: "admin1",
                 login_ID: "admin1",
                    admin: "true",
                   active: "true",
               created_at: Time.zone.now)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
