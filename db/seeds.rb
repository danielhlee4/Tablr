require "open-uri"
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
    [User, Restaurant, Reservation, Review].each(&:destroy_all)
  
    puts "Resetting primary keys..."
    # For easy testing, so that after seeding, the first `User` has `id` of 1
    ['users', 'restaurants', 'reservations', 'reviews'].each do |table_name|
      ApplicationRecord.connection.reset_pk_sequence!(table_name)
    end
end  

puts "Creating users..."

User.create!(
  first_name: 'Demo',
  last_name: 'Lovato', 
  email: 'demo@user.io', 
  password: 'password'
)

User.create!(
  first_name: 'Thomas',
  last_name: 'Hobbes', 
  email: 'thomas@hobbes.com', 
  password: 'password'
)

User.create!(
  first_name: 'Alice',
  last_name: 'Smith',
  email: 'demo1@demo.com',
  password: 'password'
)

User.create!(
  first_name: 'Bob',
  last_name: 'Johnson',
  email: 'demo2@demo.com',
  password: 'password'
)

User.create!(
  first_name: 'Carol',
  last_name: 'Williams',
  email: 'demo3@demo.com',
  password: 'password'
)

User.create!(
  first_name: 'Dave',
  last_name: 'Brown',
  email: 'demo4@demo.com',
  password: 'password'
)

User.create!(
  first_name: 'Eve',
  last_name: 'Jones',
  email: 'demo5@demo.com',
  password: 'password'
)

User.create!(
  first_name: 'Frank',
  last_name: 'Garcia',
  email: 'demo6@demo.com',
  password: 'password'
)

User.create!(
  first_name: 'Grace',
  last_name: 'Miller',
  email: 'demo7@demo.com',
  password: 'password'
)

User.create!(
  first_name: 'Henry',
  last_name: 'Davis',
  email: 'demo8@demo.com',
  password: 'password'
)

User.create!(
  first_name: 'Isabel',
  last_name: 'Rodriguez',
  email: 'demo9@demo.com',
  password: 'password'
)

User.create!(
  first_name: 'John',
  last_name: 'Martinez',
  email: 'demo10@demo.com',
  password: 'password'
)

puts "Creating restaurants..."

la_pizza = Restaurant.create!(
  name: 'La Pizza & La Pasta',
  description: "While pizza and pasta are just the tip of the Italian iceberg, there is a reason these two culinary staples are the most beloved exports from Italy. At La Pizza & La Pasta, enjoy our seasonal selection just steps away from where our expert pasta chefs and dough-slinging pizzaioli (pizza makers) create dishes before your eyes.",
  cuisine: 'Italian',
  expense: '$$',
  price_range: '$30 and under',
  neighborhood: "Hell's Kitchen",
  address: '200 5th Ave, New York, NY 10010',
  phone: '(212) 229-2560',
  website_url: 'https://www.eataly.com/us_en/stores/nyc-flatiron/nyc-la-pizza-la-pasta/',
  lat: 40.742087,
  long: -73.989662
)

la_pizza.photo.attach(
  io: URI.open('https://tablr-seeds.s3.amazonaws.com/lapizza.jpeg'),
  filename: "restaurant_la_pizza.jpeg"
)

Restaurant.create!(
  name: 'Hawksmoor NYC',
  description: "Located in the heart of Gramercy in the restored Assembly Hall of the landmarked United Charities Building, Hawksmoor is a steak restaurant that celebrates all-natural, pasture-reared, and traditionally dry-aged beef. Our beef is seasoned simply with sea salt and cooked over live-fire charcoal. Our seafood is locally and sustainably sourced from northeastern waters and we use small-farm produce whenever possible. On Sunday afternoons Hawksmoor keeps with the tried-and-true British tradition and features a Sunday Roast. Completing our offerings are award-winning cocktails, including New York City's coldest martini, and a carefully curated wine selection.",
  cuisine: 'American',
  expense: '$$$$',
  price_range: '$50 and over',
  neighborhood: "Hell's Kitchen",
  address: '109 E 22nd St, New York, NY 10010',
  phone: '(212) 777-1840',
  website_url: 'http://www.hawksmoornyc.com/',
  lat: 40.738962,
  long: -73.986616
)

hawksmoor_nyc = Restaurant.find_by(name: 'Hawksmoor NYC')
hawksmoor_nyc.photo.attach(
  io: URI.open('https://tablr-seeds.s3.amazonaws.com/hawksmoor.jpeg'),
  filename: "restaurant_hawksmoor_nyc.jpeg"
)

Restaurant.create!(
  name: 'STK - Rooftop',
  description: "STK Steakhouse is “not your daddy’s steakhouse,” offering a high-energy dining experience that artfully combines the superior quality of a traditional steakhouse with a Vibe Dining atmosphere unlike any other. Delectable cuisine, upscale cocktails and an elevated Happy Hour, along with an in-house DJ and chic décor, all come together to offer a memorable fine dining experience that keeps guests enjoying their evening from drinks to dinner to late night.",
  cuisine: 'American',
  expense: '$$$',
  price_range: '$31 to $50',
  neighborhood: "Hell's Kitchen",
  address: '26 Little West 12th street, New York, NY 10014',
  phone: '(646) 624-2441',
  website_url: 'http://www.togrp.com/',
  lat: 40.740675,
  long: -74.007755
)

stk_rooftop = Restaurant.find_by(name: 'STK - Rooftop')
stk_rooftop.photo.attach(
  io: URI.open('https://tablr-seeds.s3.amazonaws.com/stkrooftop.webp'),
  filename: "restaurant_stk_rooftop.webp"
)

Restaurant.create!(
  name: 'Marseille',
  description: "For nearly two decades, Marseille has been the essential French brasserie of Broadway & Hell's Kitchen, its favorite gathering place and its premiere dining destination. The brasserie has long been known as the heartbeat of its neighborhood, and as such Marseilles is beloved by neighbors, theatre goers, performers, tourists, and lovers of joie de vivre of all ages and backgrounds.",
  cuisine: 'French',
  expense: '$$',
  price_range: '$30 and under',
  neighborhood: "Hell's Kitchen",
  address: '630 9th Ave, New York, NY 10036',
  phone: '(212) 333-2323',
  website_url: 'https://marseillenyc.com/',
  lat: 40.759858,
  long: -73.991936
)

marseille = Restaurant.find_by(name: 'Marseille')
marseille.photo.attach(
  io: URI.open('https://tablr-seeds.s3.amazonaws.com/marseille.webp'),
  filename: "restaurant_marseille.webp"
)

Restaurant.create!(
  name: 'Bad Roman',
  description: 'A new lively, modern Italian restaurant from Quality Branded.',
  cuisine: 'Italian',
  expense: '$$$',
  price_range: '$31 to $50',
  neighborhood: "Hell's Kitchen",
  address: '10 Columbus Cir, New York, NY 10019',
  phone: '(212) 970-2033',
  website_url: 'http://www.badromannyc.com/',
  lat: 40.768098,
  long: -73.982225
)

bad_roman = Restaurant.find_by(name: 'Bad Roman')
bad_roman.photo.attach(
  io: URI.open('https://tablr-seeds.s3.amazonaws.com/badroman.jpeg'),
  filename: "restaurant_bad_roman.jpeg"
)

Restaurant.create!(
  name: 'Bombay Grill House',
  description: "Casual dining restaurant, cozy atmosphere. We serve authentic Indian food. We serve wine & beers. Best signature dish “butter chicken & tandoori chicken” award winning 🏆chicken tikka masala, many more goan dishes & vegan specialty.",
  cuisine: 'Indian',
  expense: '$$',
  price_range: '$30 and under',
  neighborhood: "Hell's Kitchen",
  address: '764 9th Ave, New York, NY 10019-6321',
  phone: '(212) 977-1010',
  website_url: 'http://www.bombaygrillhousenyc.com/',
  lat: 40.763631,
  long: -73.988634
)

bombay_grill_house = Restaurant.find_by(name: 'Bombay Grill House')
bombay_grill_house.photo.attach(
  io: URI.open('https://tablr-seeds.s3.amazonaws.com/bombaygrillhouse.webp'),
  filename: "restaurant_bombay_grill_house.webp"
)

Restaurant.create!(
  name: 'Tito Murphy\'s',
  description: "Tito Murphy’s is a lively cantina offering authentic Mexican Cuisine in the heart of the Theatre District on Restaurant Row. It’s the perfect location to enjoy fresh authentic food, amazing drinks and a great atmosphere. We will do our best to honor seating requests, but can not guarantee seating in specific areas at this time.",
  cuisine: 'Mexican',
  expense: '$$',
  price_range: '$30 and under',
  neighborhood: "Hell's Kitchen",
  address: '346 W 46th St, New York, NY 10036',
  phone: '(212) 245-2030',
  website_url: 'https://www.titomurphys.com/',
  lat: 40.759860,
  long: -73.988937
)

tito_murphys = Restaurant.find_by(name: "Tito Murphy's")
tito_murphys.photo.attach(
  io: URI.open('https://tablr-seeds.s3.amazonaws.com/titomurphys.webp'),
  filename: "restaurant_tito_murphys.webp"
)

Restaurant.create!(
  name: 'Raosu Hotpot & Sushi',
  description: "Raosu Hotpot & Sushi is one of NYC’s newest Asian fusion restaurants. Located in the heart of Midtown Manhattan, we are passionate about blending traditional Asian tastes with modern techniques to create innovative new flavors that will delight your palate. Raosu specializes in both traditional hotpot and sushi, offering a variety of options to suit your needs. Whether you’re looking to dine in, get delivery, or take out, we’ve got you covered. We believe that food should be both delicious and convenient, which is why we strive to provide our customers with the highest quality ingredients and an impeccable service, few restaurants in NYC can match!",
  cuisine: 'Asian',
  expense: '$$$$',
  price_range: '$50 and over',
  neighborhood: "Hell's Kitchen",
  address: '310 W 38th St, New York, NY 10018-3074',
  phone: '(212) 884-1218',
  website_url: 'https://raosu.com/',
  lat: 40.755154,
  long: -73.992573
)

raosu_hotpot_sushi = Restaurant.find_by(name: 'Raosu Hotpot & Sushi')
raosu_hotpot_sushi.photo.attach(
  io: URI.open('https://tablr-seeds.s3.amazonaws.com/raosu.webp'),
  filename: "restaurant_raosu_hotpot_sushi.webp"
)

Restaurant.create!(
  name: 'The Ready Rooftop Bar',
  description: 'Located in the heart of the East Village at the top of the Moxy East Village The Ready is an all-season rooftop oasis perfect for after-work drinks, weekend revelry and private events. Collegial yet refined, The Ready at Moxy East Village feels like an escape from the New York daily grind. The eclectic décor (string lights, a vine-strewn mural, a bar made of plastic milk crates) and unique food and beverage offerings create a relaxed rooftop experience—like a coveted New York City backyard. The retractable glass walls and roof allow for all-season panoramic views of the East Village and beyond.',
  cuisine: 'Bar / Lounge',
  expense: '$$',
  price_range: '$31 to $50',
  neighborhood: 'East Village',
  address: '112 E 11th St, New York, NY 10003',
  phone: '(646) 908-2125',
  website_url: 'http://moxyeastvillage.com/the-ready-rooftop-bar/',
  lat: 40.731206,
  long: -73.988396
)

the_ready_rooftop_bar = Restaurant.find_by(name: 'The Ready Rooftop Bar')
the_ready_rooftop_bar.photo.attach(
  io: URI.open('https://tablr-seeds.s3.amazonaws.com/theready.webp'),
  filename: "restaurant_the_ready_rooftop_bar.webp"
)

Restaurant.create!(
  name: '11 Tigers',
  description: "11 Tigers is New York City’s first-ever speakeasy with a Thai heart and a Japanese soul. The marriage of these two culinary cultures is reflected in our menu, which includes small plates like Crying Tiger Gyoza and Thai Larb Tuna as well as larger dishes like 11 Tigers Tom Yum Ramen—tonkatsu ramen with jumbo prawn—and Black Panther Curry, squid ink fettuccine in makrut lime scented Thai Panang curry topped with seared ribeye steak.",
  cuisine: 'Japanese',
  expense: '$$$',
  price_range: '$31 to $50',
  neighborhood: 'East Village',
  address: '225 Avenue B 2nd floor, New York, NY 10009-3358',
  phone: '(929) 235-6826',
  website_url: 'https://www.11tigersnyc.com/',
  lat: 40.727775,
  long: -73.978508
)

eleven_tigers = Restaurant.find_by(name: '11 Tigers')
eleven_tigers.photo.attach(
  io: URI.open('https://tablr-seeds.s3.amazonaws.com/11tigers.webp'),
  filename: "restaurant_eleven_tigers.webp"
)

Restaurant.create!(
  name: 'Cathédrale',
  description: "Cathédrale is a French-Mediterranean restaurant by Tao Group Hospitality Chef/Partner Ralph Scamardella, in collaboration with Executive Chef Jason Hall (formerly of acclaimed restaurants like Gotham Bar & Grill, Anthos and Craft). The menu brings elemental, ingredient-driven cooking to the forefront, evoking the grandeur of the past while remaining contemporary in its execution. Dishes put pleasure over spectacle, taking inspiration from Southern France with traces of Italy, Spain and Greece as seen in the Potato Chip Omelette, Rotisserie Chicken, 8oz Filet Mignon ’Banquiere,’ Black Truffle Fettuccine, and more.",
  cuisine: 'French',
  expense: '$$$',
  price_range: '$31 to $50',
  neighborhood: 'East Village',
  address: '112 East 11th St, New York, NY 10003',
  phone: '(212) 888-1093',
  website_url: 'http://moxyeastvillage.com/cathedrale/',
  lat: 40.731216,
  long: -73.988437
)

cathedrale = Restaurant.find_by(name: 'Cathédrale')
cathedrale.photo.attach(
  io: URI.open('https://tablr-seeds.s3.amazonaws.com/cathedrale.webp'),
  filename: "restaurant_cathedrale.webp"
)

Restaurant.create!(
  name: 'Nai Tapas Restaurant',
  description: "Nai, meaning Mother in Gallego, offers a unique understanding of Spanish cuisine where guests can dive deep into Chef Ruben Rodriguez' innovative tapas menu. Originating from Galicia, Spain, Chef Ruben Rodriguez has honed Nai's bold flavors from his Mother, Ana Maria Gonzalez Arias.",
  cuisine: 'Tapas',
  expense: '$$',
  price_range: '$30 and under',
  neighborhood: 'East Village',
  address: '84 2nd Ave, New York, NY 10003',
  phone: '(212) 677-1030',
  website_url: 'http://nairestaurant.com/nai',
  lat: 40.726686,
  long: -73.988495
)

nai_tapas = Restaurant.find_by(name: 'Nai Tapas Restaurant')
nai_tapas.photo.attach(
  io: URI.open('https://tablr-seeds.s3.amazonaws.com/naitapas.webp'),
  filename: "restaurant_nai_tapas.webp"
)

Restaurant.create!(
  name: 'Pineapple Club',
  description: "Be transported to a tropical paradise located in the heart of the East Village. #1 Espresso Martini in NYC 2 years running, our frozen piña colada and pineapple chili margaritas are fan favorites. Lush tropical vibes, pink couches, pineapples everywhere! Famous for our contemporary tiki cocktails created by mixologist Nazar Hrab, and our New-American / Tropical menu from Chef Colleen Dalton. Also known for our Disco brunch - think oyster shooters, Banana Bread French toast, fried chicken and biscuits, pineapple mimosas, and a fire disco playlist by Kong Yan.",
  cuisine: 'American',
  expense: '$$$',
  price_range: '$31 to $50',
  neighborhood: 'East Village',
  address: '509 E 6th St, New York, NY 10009',
  phone: '(212) 697-8600',
  website_url: 'http://www.pineappleclub.com/',
  lat: 40.724289,
  long: -73.984532
)

pineapple_club = Restaurant.find_by(name: 'Pineapple Club')
pineapple_club.photo.attach(
  io: URI.open('https://tablr-seeds.s3.amazonaws.com/pineappleclub.webp'),
  filename: "restaurant_pineapple_club.webp"
)

Restaurant.create!(
  name: 'Wildair',
  description: 'A New York Restaurant. Some people call us a wine bar.',
  cuisine: 'Wine Bar',
  expense: '$$$',
  price_range: '$31 to $50',
  neighborhood: 'East Village',
  address: '142 Orchard St, New York, NY 10002-3107',
  phone: '(646) 964-5624',
  website_url: 'http://www.wildair.nyc/',
  lat: 40.719839,
  long: -73.988822
)

wildair = Restaurant.find_by(name: 'Wildair')
wildair.photo.attach(
  io: URI.open('https://tablr-seeds.s3.amazonaws.com/wildair.webp'),
  filename: "restaurant_wildair.webp"
)

Restaurant.create!(
  name: 'Pylos',
  description: 'PYLOS honors the breadth of traditional Greek cuisine by bringing fresh, wholesome cooking from all regions of Greece to an elegant, contemporary and comfortable setting in the East Village.',
  cuisine: 'Greek',
  expense: '$$$',
  price_range: '$31 to $50',
  neighborhood: 'East Village',
  address: '128 East 7th Street, New York, NY 10009',
  phone: '(212) 473-0220',
  website_url: 'http://www.pylosrestaurant.com/',
  lat: 40.725924,
  long: -73.983416
)

pylos = Restaurant.find_by(name: 'Pylos')
pylos.photo.attach(
  io: URI.open('https://tablr-seeds.s3.amazonaws.com/pylos.webp'),
  filename: "restaurant_pylos.webp"
)

Restaurant.create!(
  name: 'The Black Ant',
  description: "The Black Ant, a modern Mexican restaurant focusing on the traditional and uniquely sourced ingredients of Mexico in a contemporary, “Cocina de Autor” from Chef Gerardo Duarte in Manhattan’s East Village. Contemporary Latin Cuisine, harmoniously paired with our innovative handcrafted cocktails. Come on in and enjoy yourselves.",
  cuisine: 'Mexican',
  expense: '$$',
  price_range: '$30 and under',
  neighborhood: 'East Village',
  address: '60 2nd Avenue, New York, NY 10003',
  phone: '(212) 598-0300',
  website_url: 'http://www.theblackantnyc.com/',
  lat: 40.725891,
  long: -73.988473
)

the_black_ant = Restaurant.find_by(name: 'The Black Ant')
the_black_ant.photo.attach(
  io: URI.open('https://tablr-seeds.s3.amazonaws.com/theblackant.webp'),
  filename: "restaurant_the_black_ant.webp"
)

Restaurant.create!(
  name: 'Rosa Mexicano',
  description: "Located adjacent to Manhattan’s bustling Union Square, Rosa Mexicano’s third New York location was designed with iconic bold colors and rich architectural details. Featuring both our largest bar and a private room for special events, Rosa Mexicano in Union Square lends itself to any occasion. Known for tableside guacamole service and creative margaritas, Rosa Mexicano offers a fresh take on authentic Mexican cuisine, serving both beloved classics and sophisticated dishes in a fun atmosphere. Our beverage program boasts over 100 varieties of tequila and agave-based spirits, and our signature Latin hospitality is delivered with warmth and professionalism. A destination born of a unique vision, at Rosa Mexicano you will experience upscale dining that honors Mexican heritage, culinary techniques, and the global explorations and inspirations of our founder, Josefina Howard, who was a world traveler, entrepreneur, interior designer, chef, and innovator.",
  cuisine: 'Mexican',
  expense: '$$',
  price_range: '$30 and under',
  neighborhood: 'Union Square',
  address: '9 E 18th St, New York, NY 10003',
  phone: '(212) 533-3350',
  website_url: 'http://RosaMexicano.com/',
  lat: 40.737587,
  long: -73.991665
)

rosa_mexicano = Restaurant.find_by(name: 'Rosa Mexicano')
rosa_mexicano.photo.attach(
  io: URI.open('https://tablr-seeds.s3.amazonaws.com/rosamexicano.webp'),
  filename: "restaurant_rosa_mexicano.webp"
)

Restaurant.create!(
  name: 'Xu\'s Public House',
  description: "Located at Union Square, New York City, Xu’s Public House offers a unique twist for an authentic Cantonese Dim Sum dining experience. With a lifelong dream to share the vibrant flavors of their homeland, three friends from Hong Kong united to open Xu's Public House in Union Square. Guided by a skilled chef who traveled across China, they curated a menu that showcased the essence of Cantonese cuisine, while their elegant glass-ceiling dining room added a touch of enchantment. Xu's Public House became a symbol of Asian dreams fulfilled, delighting guests with an unforgettable culinary experience.",
  cuisine: 'Chinese',
  expense: '$$$',
  price_range: '$31 to $50',
  neighborhood: 'Union Square',
  address: '15 Union Sq W, New York, NY 10003',
  phone: '(212) 901-9971',
  website_url: 'http://xupublic.com/',
  lat: 40.736883,
  long: -73.990506
)

xus_public_house = Restaurant.find_by(name: 'Xu\'s Public House')
xus_public_house.photo.attach(
  io: URI.open('https://tablr-seeds.s3.amazonaws.com/xuspublichoue.webp'),
  filename: "restaurant_xus_public_house.webp"
)

Restaurant.create!(
  name: 'Max Brenner',
  description: "For more than 20 years, Max Brenner has offered a chocolate experience for all the senses. A visit to our Chocolate Bar and Shop, will entice magical memories in everyone. Because, chocolate, more than any other food, symbolizes our childhood. At Max Brenner, you will enjoy an abundance of desert made of all sorts of chocolate concoctions. All of this, combined with a full menu of salads, sandwiches, entrees, and pizzas, offer an experience for anyone at any age.",
  cuisine: 'Comfort Food',
  expense: '$$',
  price_range: '$30 and under',
  neighborhood: 'Union Square',
  address: '841 Broadway, New York, NY 10003',
  phone: '(646) 467-8803',
  website_url: 'http://www.maxbrenner.com/',
  lat: 40.734670,
  long: -73.990355
)

max_brenner = Restaurant.find_by(name: 'Max Brenner')
max_brenner.photo.attach(
  io: URI.open('https://tablr-seeds.s3.amazonaws.com/maxbrenner.webp'),
  filename: "restaurant_max_brenner.webp"
)

Restaurant.create!(
  name: 'Oceans',
  description: "Oceans, a locally and globally inspired seafood restaurant, was founded by Vancouver’s award-winning Toptable Group with the philosophy of creating a timeless and approachable dining experience. Executive Chef Andy Kitko sets the vision for the menu inspired by the Pacific, Atlantic, and Mediterranean shores that will feature the freshest catches available all accented by seasonal ingredients.",
  cuisine: 'Seafood',
  expense: '$$$$',
  price_range: '$50 and over',
  neighborhood: 'Union Square',
  address: '233 Park Ave S, New York, NY 10003',
  phone: '(212) 209-1055',
  website_url: 'http://oceansnewyork.com/',
  lat: 40.737775,
  long: -73.987245
)

oceans = Restaurant.find_by(name: 'Oceans')
oceans.photo.attach(
  io: URI.open('https://tablr-seeds.s3.amazonaws.com/oceans.webp'),
  filename: "restaurant_oceans.webp"
)

Restaurant.create!(
  name: 'Craft',
  description: "Dine at Craft to experience Tom Colicchio’s signature ‘What's Local Is Best’ cooking with an always evolving collection of simply prepared dishes created to highlight high quality, seasonal ingredients. “Simple doesn’t mean simplistic,” Tom says in his book, Think Like a Chef, and the food at Craft serves as proof. Perennial favorites include pan-roasted diver scallops, braised beef short ribs, and a bounty of Greenmarket sides.",
  cuisine: 'American',
  expense: '$$$$',
  price_range: '$50 and over',
  neighborhood: 'Union Square',
  address: '43 E. 19th St., New York, NY 10003',
  phone: '(212) 780-0880',
  website_url: 'http://www.craftrestaurant.com/',
  lat: 40.737578,
  long: -73.988684
)

craft = Restaurant.find_by(name: 'Craft')
craft.photo.attach(
  io: URI.open('https://tablr-seeds.s3.amazonaws.com/craft.webp'),
  filename: "restaurant_craft.webp"
)

Restaurant.create!(
  name: 'Bhatti Indian Grill',
  description: "Bhatti Indian Grill is an ultra-authentic north Indian restaurant in the heart of NYC that’s refined yet affordable, upscale and modern. Bhatti opened its doors in 2009 to much fan fare and accolades for the authenticity it brought to indian cuisine. One of the city’s preeminent Indian chefs and restaurateurs, Gaurav Anand of Awadh and Moti Mahal Delux has completely revamped and renovated Bhatti just in time to celebrate its 10th anniversary this year.",
  cuisine: 'Indian',
  expense: '$$$',
  price_range: '$31 to $50',
  neighborhood: 'Union Square',
  address: '100 Lexington Avenue, New York, NY 10016',
  phone: '(212) 683-4228',
  website_url: 'http://www.bhattinyc.com/',
  lat: 40.743187,
  long: -73.981994
)

bhatti_indian_grill = Restaurant.find_by(name: 'Bhatti Indian Grill')
bhatti_indian_grill.photo.attach(
  io: URI.open('https://tablr-seeds.s3.amazonaws.com/bhattiindian.webp'),
  filename: "restaurant_bhatti_indian_grill.webp"
)

Restaurant.create!(
  name: 'The Stand',
  description: "The Stand welcomes its guests with their new and exciting presentation of northern Italian taverna fare. Flavors explode with a mix of chef driven small and large composed plates, homemade pastas, Brick Oven specialties and NY Style Pizzas. The beverages include crafted cocktails, a deep list of draft selections and stylistic wine selections along with one of the largest whiskey selection in NYC. Come for the Food and stay for the Comedy, a double dose of entertainment and hospitality.",
  cuisine: 'Italian',
  expense: '$$',
  price_range: '$30 and under',
  neighborhood: 'Union Square',
  address: '116 E 16th St, New York, NY 10003',
  phone: '(212) 677-2600',
  website_url: 'http://www.thestandnyc.com/',
  lat: 40.736430,
  long: -73.987864
)

the_stand = Restaurant.find_by(name: 'The Stand')
the_stand.photo.attach(
  io: URI.open('https://tablr-seeds.s3.amazonaws.com/thestand.webp'),
  filename: "restaurant_the_stand.webp"
)

Restaurant.create!(
  name: 'Tarallucci e Vino',
  description: "\"All ends well with Tarallucci e Vino\" is the famous Italian saying rooted in the tradition of resolving any matter over a glass of wine and tarallucci, the classic southern Italian cookie. Tarallucci e Vino Union Square is our flagship restaurant. This location is home to our bakery, event spaces, cooking classes and team building workshops. Our restaurant provides an authentic Italian experience in a rustic setting, bringing the ease and casual elegance of Italy’s bars and “caffe's\" to New York City.",
  cuisine: 'Italian',
  expense: '$$$',
  price_range: '$31 to $50',
  neighborhood: 'Union Square',
  address: '15 East 18th Street, New York, NY 10003',
  phone: '(212) 228-5400',
  website_url: 'http://www.taralluccievino.net/',
  lat: 40.737972,
  long: -73.990598
)

tarallucci_e_vino = Restaurant.find_by(name: 'Tarallucci e Vino')
tarallucci_e_vino.photo.attach(
  io: URI.open('https://tablr-seeds.s3.amazonaws.com/taralluci.webp'),
  filename: "restaurant_tarallucci_e_vino.webp"
)

Restaurant.create!(
  name: '5 Napkin Burger',
  description: "5 Napkin Burger is a Premium, Full-Service Burger Restaurant with a Full Craft Beer & Cocktail Bar.",
  cuisine: 'Burgers',
  expense: '$$',
  price_range: '$30 and under',
  neighborhood: 'Hell\'s Kitchen',
  address: '630 9th Ave, New York, NY 10036',
  phone: '(212) 757-2277',
  website_url: 'http://www.5napkinburger.com/',
  lat: 40.759665,
  long: -73.991631
)

napkin_burger = Restaurant.find_by(name: '5 Napkin Burger')
napkin_burger.photo.attach(
  io: URI.open('https://tablr-seeds.s3.amazonaws.com/5napkinburger.webp'),
  filename: "restaurant_5_napkin_burger.webp"
)

puts "Creating reservations..."

reservation = Reservation.create!(
  user_id: 1,
  restaurant_id: 1,
  party_size: 2,
  date: '2022-10-26',
  time: "2000-01-01T16:30:00.000-05:00",
)
# if reservation.save
#   puts "Created reservation ##{reservation.id} for user ##{user_id} at La Pizza & La Pasta."
# else
#   puts "Failed to create reservation for user ##{user_id}: #{reservation.errors.full_messages.join(", ")}"
# end

puts "Done!"