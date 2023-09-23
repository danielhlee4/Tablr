# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ApplicationRecord.transaction do 
    puts "Destroying tables..."
    # Unnecessary if using `rails db:seed:replant`
    User.destroy_all
    Restaurant.destroy_all
  
    puts "Resetting primary keys..."
    # For easy testing, so that after seeding, the first `User` has `id` of 1
    ApplicationRecord.connection.reset_pk_sequence!('users')
    ApplicationRecord.connection.reset_pk_sequence!('restaurants')
  
    puts "Creating users..."
    # Create one user with an easy to remember username, email, and password:
    User.create!(
      first_name: 'Demo',
      last_name: 'Lovato', 
      email: 'demo@user.io', 
      password: 'password'
    )
  
    User.create!(
      first_name: 'Thomas',
      last_name: 'Hobbes', 
      email: 'HomicidalPsycho@jungle.cat', 
      password: 'G.R.O.S.S'
    )

    puts "Creating restaurants..."
    Restaurant.create!(
      name: 'Bad Roman',
      description: 'A new lively, modern Italian restaurant from Quality Branded.',
      cuisine: 'Italian',
      expense: '$$$',
      price_range: '$31 to $50',
      neighborhood: "Hell's Kitchen",
      address: '10 Columbus Cir, New York, NY 10019',
      phone: '(212) 970-2033',
      website_url: 'http://www.badromannyc.com/'
    )

    Restaurant.create!(
      name: 'The Ready Rooftop Bar',
      description: 'Located in the heart of the East Village at the top of the Moxy East Village The Ready is an all-season rooftop oasis perfect for after-work drinks, weekend revelry and private events. Collegial yet refined, The Ready at Moxy East Village feels like an escape from the New York daily grind. The eclectic décor (string lights, a vine-strewn mural, a bar made of plastic milk crates) and unique food and beverage offerings create a relaxed rooftop experience—like a coveted New York City backyard. The retractable glass walls and roof allow for all-season panoramic views of the East Village and beyond.',
      cuisine: 'Bar / Lounge',
      expense: '$$',
      price_range: '$31 to $50',
      neighborhood: "East Village",
      address: '112 E 11th St, New York, NY 10003',
      phone: '(646) 908-2125',
      website_url: 'http://moxyeastvillage.com/the-ready-rooftop-bar/'
    )
  
    puts "Done!"
end