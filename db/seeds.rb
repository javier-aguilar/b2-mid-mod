# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mechanic1 = Mechanic.create(name: "Cid",
                             years_of_experience: 4)
mechanic2 = Mechanic.create(name: "Tron Bonne",
                             years_of_experience: 3)

park1 = Park.create(name: "Hershey Park",
                    admission: 50.00)
park2 = Park.create(name: "Disney World",
                    admission: 95.00)

ride1 = Ride.create(name: "Space Mountain",
                    thrill_rating: 8,
                    park_id: park2.id)
ride2 = Ride.create(name: "It's A Small World",
                    thrill_rating: 1,
                    park_id: park2.id)
ride3 = Ride.create(name: "Splash Mountain",
                   thrill_rating: 9,
                   park_id: park2.id)
ride4 = Ride.create(name: "Lightning Racer",
                    thrill_rating: 7,
                    park_id: park1.id)

mechanic1.rides << ride1
mechanic1.rides << ride2