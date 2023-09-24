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

        # Restaurant 3
    Restaurant.create!(
      name: 'Sushi Delight',
      description: 'A cozy sushi restaurant offering fresh and delicious sushi rolls.',
      cuisine: 'Japanese',
      expense: '$$',
      price_range: '$30 and under',
      neighborhood: "Hell's Kitchen",
      address: '123 Main St, New York, NY 10001',
      phone: '(212) 555-6789',
      website_url: 'http://www.sushidelightnyc.com/'
    )

    # Restaurant 4
    Restaurant.create!(
      name: 'Burger Haven',
      description: 'A burger joint known for its mouthwatering burgers and fries.',
      cuisine: 'American',
      expense: '$',
      price_range: '$30 and under',
      neighborhood: 'Union Square',
      address: '456 Elm St, New York, NY 10002',
      phone: '(212) 555-4321',
      website_url: 'http://www.burgerhavennyc.com/'
    )

    # Restaurant 5
    Restaurant.create!(
      name: 'Pasta Paradise',
      description: 'An Italian trattoria specializing in homemade pasta dishes.',
      cuisine: 'Italian',
      expense: '$$',
      price_range: '$30 and under',
      neighborhood: 'East Village',
      address: '789 Oak Ave, New York, NY 10003',
      phone: '(212) 555-9876',
      website_url: 'http://www.pastaparadisenyc.com/'
    )

    # Restaurant 6
    Restaurant.create!(
      name: 'Thai Spice House',
      description: 'An authentic Thai restaurant serving spicy and flavorful Thai cuisine.',
      cuisine: 'Thai',
      expense: '$$',
      price_range: '$30 and under',
      neighborhood: "Hell's Kitchen",
      address: '567 Pine Rd, New York, NY 10004',
      phone: '(212) 555-5432',
      website_url: 'http://www.thaispicehousenyc.com/'
    )

    # Restaurant 7
    Restaurant.create!(
      name: 'Sizzling Steakhouse',
      description: 'A classic steakhouse known for its perfectly grilled steaks and fine wines.',
      cuisine: 'Steakhouse',
      expense: '$$$',
      price_range: '$31 to $50',
      neighborhood: 'Union Square',
      address: '101 Broadway, New York, NY 10005',
      phone: '(212) 555-8765',
      website_url: 'http://www.sizzlingsteakhousenyc.com/'
    )

    # Restaurant 8
    Restaurant.create!(
      name: 'Mediterranean Flavors',
      description: 'A Mediterranean restaurant offering a variety of dishes from the Mediterranean region.',
      cuisine: 'Mediterranean',
      expense: '$$',
      price_range: '$30 and under',
      neighborhood: "Hell's Kitchen",
      address: '222 Willow Ln, New York, NY 10006',
      phone: '(212) 555-7654',
      website_url: 'http://www.medflavorsnyc.com/'
    )

    # Restaurant 9
    Restaurant.create!(
      name: 'Café Parisienne',
      description: 'A charming café serving French pastries, coffee, and light meals.',
      cuisine: 'French',
      expense: '$',
      price_range: '$30 and under',
      neighborhood: "Hell's Kitchen",
      address: '333 Cherry St, New York, NY 10007',
      phone: '(212) 555-6543',
      website_url: 'http://www.cafeparisiennenyc.com/'
    )

    # Restaurant 10
    Restaurant.create!(
      name: 'Vegetarian Delight',
      description: 'A vegetarian and vegan-friendly restaurant with a variety of plant-based dishes.',
      cuisine: 'Vegan',
      expense: '$$',
      price_range: '$30 and under',
      neighborhood: 'East Village',
      address: '444 Birch Ave, New York, NY 10008',
      phone: '(212) 555-2345',
      website_url: 'http://www.vegetariandelightnyc.com/'
    )

    Restaurant.create!(
      name: "The Rustic Grill",
      description: "A cozy grill and bar offering a diverse menu of American classics and craft cocktails.",
      cuisine: 'American',
      expense: '$$$',
      price_range: '$31 to $50',
      neighborhood: "Hell's Kitchen",
      address: "123 W 45th St, New York, NY 10036",
      phone: "(212) 555-1111",
      website_url: "http://www.rusticgrillnyc.com/"
    )

    Restaurant.create!(
      name: "Szechuan Delights",
      description: "Experience the bold flavors of Szechuan cuisine in the heart of Hell's Kitchen.",
      cuisine: 'Chinese',
      expense: '$$',
      price_range: '$30 and under',
      neighborhood: "Hell's Kitchen",
      address: "456 9th Ave, New York, NY 10018",
      phone: "(212) 555-2222",
      website_url: "http://www.szechuandelightsnyc.com/"
    )

    Restaurant.create!(
      name: "Mama Mia Trattoria",
      description: "An Italian trattoria serving homemade pasta, pizza, and other Italian favorites.",
      cuisine: 'Italian',
      expense: '$$$$',
      price_range: '$50 and over',
      neighborhood: "Hell's Kitchen",
      address: "789 10th Ave, New York, NY 10019",
      phone: "(212) 555-3333",
      website_url: "http://www.mamamiatrattoria.com/"
    )

    Restaurant.create!(
      name: "Vegan Vibes",
      description: "A trendy vegan cafe offering a diverse menu of plant-based dishes and smoothies.",
      cuisine: 'Vegan',
      expense: '$$',
      price_range: '$30 and under',
      neighborhood: 'East Village',
      address: '123 Avenue A, New York, NY 10009',
      phone: '(212) 555-1111',
      website_url: 'http://www.veganvibesnyc.com/'
    )

    Restaurant.create!(
      name: 'Sushi Fusion',
      description: 'A fusion sushi restaurant blending Japanese and Latin American flavors.',
      cuisine: 'Latin Fusion',
      expense: '$$$',
      price_range: '$31 to $50',
      neighborhood: 'East Village',
      address: '456 E 9th St, New York, NY 10003',
      phone: '(212) 555-2222',
      website_url: 'http://www.sushifusionnyc.com/'
    )

    Restaurant.create!(
      name: 'The Gourmet Bistro',
      description: 'An upscale bistro offering gourmet French cuisine in a romantic setting.',
      cuisine: 'French',
      expense: '$$$$',
      price_range: '$50 and over',
      neighborhood: 'East Village',
      address: '789 Broadway, New York, NY 10012',
      phone: '(212) 555-3333',
      website_url: 'http://www.gourmetbistronyc.com/'
    )

    Restaurant.create!(
      name: 'Taco Heaven',
      description: 'A lively Mexican taqueria known for its authentic street tacos and margaritas.',
      cuisine: 'Mexican',
      expense: '$$',
      price_range: '$30 and under',
      neighborhood: 'East Village',
      address: '234 E 4th St, New York, NY 10009',
      phone: '(212) 555-4444',
      website_url: 'http://www.tacoheavennyc.com/'
    )

    Restaurant.create!(
      name: 'Prime Steakhouse',
      description: 'An elegant steakhouse specializing in prime cuts and fine wines.',
      cuisine: 'Steakhouse',
      expense: '$$$$',
      price_range: '$50 and over',
      neighborhood: 'East Village',
      address: '567 E 6th St, New York, NY 10009',
      phone: '(212) 555-5555',
      website_url: 'http://www.primesteakhousenyc.com/'
    )


    Restaurant.create!(
      name: "Green Leaf Cafe",
      description: "A health-conscious cafe offering fresh salads, sandwiches, and smoothies.",
      cuisine: 'Café',
      expense: '$$',
      price_range: '$30 and under',
      neighborhood: 'Union Square',
      address: '123 Union Square W, New York, NY 10003',
      phone: '(212) 555-1111',
      website_url: 'http://www.greenleafcafenyc.com/'
    )

    Restaurant.create!(
      name: 'Fusion Grill',
      description: 'A fusion restaurant blending Asian and South American flavors in unique dishes.',
      cuisine: 'Asian Fusion',
      expense: '$$$',
      price_range: '$31 to $50',
      neighborhood: 'Union Square',
      address: '456 Broadway, New York, NY 10012',
      phone: '(212) 555-2222',
      website_url: 'http://www.fusiongrillnyc.com/'
    )

    Restaurant.create!(
      name: 'The Artisan Table',
      description: 'An artisanal restaurant known for its farm-to-table approach and seasonal menus.',
      cuisine: 'Farm-to-Table',
      expense: '$$$$',
      price_range: '$50 and over',
      neighborhood: 'Union Square',
      address: '789 Park Ave S, New York, NY 10016',
      phone: '(212) 555-3333',
      website_url: 'http://www.artisan-tablenyc.com/'
    )

    Restaurant.create!(
      name: 'Taste of India',
      description: 'An authentic Indian restaurant offering a rich tapestry of flavors and spices.',
      cuisine: 'Indian',
      expense: '$$',
      price_range: '$30 and under',
      neighborhood: 'Union Square',
      address: '234 E 17th St, New York, NY 10003',
      phone: '(212) 555-4444',
      website_url: 'http://www.tasteofindianyc.com/'
    )

    Restaurant.create!(
      name: 'Seafood Harbor',
      description: 'A seafood restaurant specializing in fresh catches and ocean-inspired dishes.',
      cuisine: 'Seafood',
      expense: '$$$',
      price_range: '$31 to $50',
      neighborhood: 'Union Square',
      address: '567 Park Ave S, New York, NY 10010',
      phone: '(212) 555-5555',
      website_url: 'http://www.seafoodharbornyc.com/'
    )

    Restaurant.create!(
      name: 'Vegetarian Delights',
      description: 'A vegetarian and vegan-friendly restaurant with innovative plant-based dishes.',
      cuisine: 'Vegan',
      expense: '$$',
      price_range: '$30 and under',
      neighborhood: 'Union Square',
      address: '789 Broadway, New York, NY 10013',
      phone: '(212) 555-6666',
      website_url: 'http://www.vegetariandelightsnyc.com/'
    )


  
    puts "Done!"
end