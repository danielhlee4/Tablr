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

puts "Creating reservations and reviews..."

# Pizza pasta restaurant
Reservation.create!(
  user_id: 8,
  restaurant_id: 1,
  party_size: 2,
  date: '2022-01-26',
  time: "2000-01-01T16:30:00.000-05:00",
)

Review.create!(
  reservation_id: 1,
  restaurant_id: 1,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 4,
  ambiance_rating: 4,
  value_rating: 5,
  body: "Absolutely loved the pizza and pasta at La Pizza & La Pasta! Authentic Italian taste with every bite. The service was good, and the ambiance made our dining experience very enjoyable. Definitely worth the price!"
)

Reservation.create!(
  user_id: 2,
  restaurant_id: 1,
  party_size: 3,
  date: '2022-02-22',
  time: "2000-01-01T16:30:00.000-05:00",
)

Review.create!(
  reservation_id: 2,
  restaurant_id: 1,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 3,
  ambiance_rating: 4,
  value_rating: 4,
  body: "A delightful experience overall. The pasta dishes were delicious, although the service could have been a bit more attentive. The atmosphere is cozy and inviting. Will come back!"
)

Reservation.create!(
  user_id: 3,
  restaurant_id: 1,
  party_size: 5,
  date: '2022-04-19',
  time: "2000-01-01T16:30:00.000-05:00",
)

Review.create!(
  reservation_id: 3,
  restaurant_id: 1,
  overall_rating: 3,
  food_rating: 3,
  service_rating: 2,
  ambiance_rating: 4,
  value_rating: 3,
  body: "The food was decent but nothing extraordinary. Service was slow, and we felt a bit ignored. The ambiance is the saving grace of this place. Might give it another try in the future."
)

Reservation.create!(
  user_id: 4,
  restaurant_id: 1,
  party_size: 4,
  date: '2022-07-11',
  time: "2000-01-01T16:30:00.000-05:00",
)

Review.create!(
  reservation_id: 4,
  restaurant_id: 1,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 5,
  body: "An outstanding dining experience! From the appetizers to the main course, everything was perfect. The staff were very welcoming and the atmosphere was delightful. Highly recommend!"
)

Reservation.create!(
  user_id: 5,
  restaurant_id: 1,
  party_size: 4,
  date: '2022-09-01',
  time: "2000-01-01T16:30:00.000-05:00",
)

Review.create!(
  reservation_id: 5,
  restaurant_id: 1,
  overall_rating: 4,
  food_rating: 5,
  service_rating: 4,
  ambiance_rating: 3,
  value_rating: 4,
  body: "The pizza here is probably the best I've had outside of Italy. Service was good, though the place was a bit crowded and noisy. Good value for money."
)

Reservation.create!(
  user_id: 6,
  restaurant_id: 1,
  party_size: 6,
  date: '2023-07-18',
  time: "2000-01-01T16:30:00.000-05:00",
)

Review.create!(
  reservation_id: 6,
  restaurant_id: 1,
  overall_rating: 2,
  food_rating: 2,
  service_rating: 2,
  ambiance_rating: 3,
  value_rating: 2,
  body: "Was really looking forward to dining here, but it turned out to be a disappointment. The food was mediocre, and the service was lackluster. Not sure if I'd want to visit again."
)

Reservation.create!(
  user_id: 7,
  restaurant_id: 1,
  party_size: 8,
  date: '2023-10-11',
  time: "2000-01-01T16:30:00.000-05:00",
)

Review.create!(
  reservation_id: 7,
  restaurant_id: 1,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 4,
  body: "A wonderful evening at La Pizza & La Pasta. The food is as authentic as it gets, and the service was exceptional. A bit pricey, but for the quality and experience, it’s worth it."
)

# Hawksmoor

Reservation.create!(
  user_id: 3,
  restaurant_id: 2,
  party_size: 4,
  date: '2022-01-15',
  time: "2000-01-01T16:30:00.000-05:00",
)

Review.create!(
  reservation_id: 8,
  restaurant_id: 2,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 4,
  value_rating: 4,
  body: "Hawksmoor NYC lives up to the hype. The dry-aged steak was sublime, and the charcoal cooking introduced a unique flavor profile. The service was attentive without being intrusive. The ambiance had a refined, old-world charm, although a tad noisy, which is to be expected in such a popular spot. While pricey, it's an experience I'll be repeating."
)

Reservation.create!(
  user_id: 4,
  restaurant_id: 2,
  party_size: 2,
  date: '2022-05-09',
  time: "2000-01-01T16:30:00.000-05:00",
)

Review.create!(
  reservation_id: 9,
  restaurant_id: 2,
  overall_rating: 3,
  food_rating: 3,
  service_rating: 2,
  ambiance_rating: 4,
  value_rating: 3,
  body: "The ambiance at Hawksmoor was impressive, and the historic building added to the charm. Unfortunately, the steaks didn't quite meet our expectations - not as tender as anticipated, and the seasoning was heavier than preferred. Service was a little slow, probably due to the busy hour. For the price point, I was expecting a bit more."
)

Reservation.create!(
  user_id: 5,
  restaurant_id: 2,
  party_size: 5,
  date: '2022-09-21',
  time: "2000-01-01T16:30:00.000-05:00",
)

Review.create!(
  reservation_id: 10,
  restaurant_id: 2,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 4,
  body: "The steaks are indeed the star at Hawksmoor. I enjoyed the locally sourced beef, which was cooked to perfection. The service was excellent - our waiter was knowledgeable and recommended the perfect wine pairing. The ambiance is just what you want from a New York steakhouse. It's a bit on the expensive side, but for a special occasion, it's worth it."
)

Reservation.create!(
  user_id: 6,
  restaurant_id: 2,
  party_size: 3,
  date: '2023-02-17',
  time: "2000-01-01T16:30:00.000-05:00",
)

Review.create!(
  reservation_id: 11,
  restaurant_id: 2,
  overall_rating: 4,
  food_rating: 5,
  service_rating: 4,
  ambiance_rating: 5,
  value_rating: 3,
  body: "From the moment we walked into Hawksmoor, the ambiance was captivating, with its striking balance of grandeur and comfort. The steak was one of the best I've had - juicy and full of flavor. The service was good, though it seemed they were short-staffed. The pricing is steep, but for an occasional splurge, it's justified."
)

Reservation.create!(
  user_id: 7,
  restaurant_id: 2,
  party_size: 7,
  date: '2023-10-05',
  time: "2000-01-01T16:30:00.000-05:00",
)

Review.create!(
  reservation_id: 12,
  restaurant_id: 2,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 5,
  body: "Our group was blown away by the exceptional quality at Hawksmoor. The Sunday Roast was a delightful tradition, with perfectly cooked beef and all."
)

# stk rooftop

Reservation.create!(
  user_id: 2,
  restaurant_id: stk_rooftop.id,
  party_size: 4,
  date: '2022-01-10',
  time: "2000-01-01T16:30:00.000-05:00",
)

Review.create!(
  reservation_id: 13,
  restaurant_id: stk_rooftop.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 4,
  ambiance_rating: 5,
  value_rating: 3,
  body: "The rooftop view was the perfect complement to the juicy steaks. The cocktails were inventive, and the DJ's playlist kept the energy high throughout the evening. Prices were a bit steep for the portion sizes but the vibe made up for it."
)

Reservation.create!(
  user_id: 3,
  restaurant_id: stk_rooftop.id,
  party_size: 2,
  date: '2022-03-20',
  time: "2000-01-01T16:30:00.000-05:00",
)

Review.create!(
  reservation_id: 14,
  restaurant_id: stk_rooftop.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 4,
  body: "STK Rooftop doesn't just sell steaks, they deliver an experience. Every bite was a delight, and the service was impeccable. The lively atmosphere didn't overshadow the intimate setting as we dined under the stars."
)

Reservation.create!(
  user_id: 4,
  restaurant_id: stk_rooftop.id,
  party_size: 3,
  date: '2022-06-15',
  time: "2000-01-01T16:30:00.000-05:00",
)

Review.create!(
  reservation_id: 15,
  restaurant_id: stk_rooftop.id,
  overall_rating: 3,
  food_rating: 3,
  service_rating: 2,
  ambiance_rating: 4,
  value_rating: 3,
  body: "The steak was good, though not the best I've had. The service was a bit slow, perhaps due to the crowd. The rooftop atmosphere is fantastic, especially as the evening lights come on. A bit pricey for the overall experience."
)

Reservation.create!(
  user_id: 5,
  restaurant_id: stk_rooftop.id,
  party_size: 5,
  date: '2022-08-29',
  time: "2000-01-01T16:30:00.000-05:00",
)

Review.create!(
  reservation_id: 16,
  restaurant_id: stk_rooftop.id,
  overall_rating: 2,
  food_rating: 2,
  service_rating: 3,
  ambiance_rating: 5,
  value_rating: 2,
  body: "STK Rooftop's ambiance is undeniably vibrant. However, the steaks were underwhelming for their price point. The service was decent but didn't make up for the lack of culinary excitement."
)

Reservation.create!(
  user_id: 6,
  restaurant_id: stk_rooftop.id,
  party_size: 6,
  date: '2022-11-12',
  time: "2000-01-01T16:30:00.000-05:00",
)

Review.create!(
  reservation_id: 17,
  restaurant_id: stk_rooftop.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 4,
  ambiance_rating: 5,
  value_rating: 4,
  body: "An extraordinary evening at STK Rooftop. The steakhouse redefines the dining experience with its high energy and exceptional steaks. The service was nearly as impressive as the city views. Worth every penny."
)

Reservation.create!(
  user_id: 7,
  restaurant_id: stk_rooftop.id,
  party_size: 7,
  date: '2023-04-22',
  time: "2000-01-01T16:30:00.000-05:00",
)

Review.create!(
  reservation_id: 18,
  restaurant_id: stk_rooftop.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 4,
  ambiance_rating: 5,
  value_rating: 3,
  body: "The rooftop setting of STK provides an unbeatable ambiance for a special night out. The steak was cooked to perfection, and the starters were delightful. Service was good, though the high prices will make me consider it for only special occasions."
)

# marseille

Reservation.create!(
  user_id: 2,
  restaurant_id: marseille.id,
  party_size: 2,
  date: '2022-01-15',
  time: "2000-01-01T16:30:00.000-05:00",
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: marseille.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 5,
  ambiance_rating: 4,
  value_rating: 4,
  body: "Marseille is a slice of Paris in New York. The brasserie atmosphere was authentically French, bustling yet cozy. The bouillabaisse was a flavorful delight, and the wait staff were cordially attentive."
)

Reservation.create!(
  user_id: 3,
  restaurant_id: marseille.id,
  party_size: 3,
  date: '2022-03-22',
  time: "2000-01-01T16:30:00.000-05:00",
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: marseille.id,
  overall_rating: 3,
  food_rating: 3,
  service_rating: 4,
  ambiance_rating: 3,
  value_rating: 3,
  body: "The dining experience at Marseille was pleasant, with classic dishes that were well-executed. Service was good, though not outstanding. The ambiance could use a touch more warmth to truly replicate a Parisian brasserie."
)

Reservation.create!(
  user_id: 4,
  restaurant_id: marseille.id,
  party_size: 4,
  date: '2022-05-30',
  time: "2000-01-01T16:30:00.000-05:00",
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: marseille.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 5,
  body: "Marseille was exceptional in every way, from the escargots and duck confit to the perfectly paired wines. The service was impeccable, and the lively ambiance made for a memorable evening. It's a must-visit for anyone seeking authentic French cuisine."
)

Reservation.create!(
  user_id: 5,
  restaurant_id: marseille.id,
  party_size: 2,
  date: '2022-08-18',
  time: "2000-01-01T16:30:00.000-05:00",
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: marseille.id,
  overall_rating: 2,
  food_rating: 2,
  service_rating: 2,
  ambiance_rating: 4,
  value_rating: 3,
  body: "While Marseille has a charming atmosphere, the dishes didn't live up to our expectations. The coq au vin lacked the depth of flavor I've savored in France, and the service was slower than we'd hoped for."
)

Reservation.create!(
  user_id: 6,
  restaurant_id: marseille.id,
  party_size: 5,
  date: '2022-11-05',
  time: "2000-01-01T16:30:00.000-05:00",
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: marseille.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 3,
  ambiance_rating: 4,
  value_rating: 4,
  body: "Marseille provided a cozy setting for our family dinner. The ratatouille was a table favorite, brimming with fresh vegetables. Service was a bit uneven, but the overall experience was quite enjoyable."
)

# Bad Roman

Reservation.create!(
  user_id: 2,
  restaurant_id: bad_roman.id,
  party_size: 2,
  date: '2022-01-20',
  time: "2000-01-01T16:30:00.000-05:00",
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: bad_roman.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 4,
  value_rating: 4,
  body: "The new hotspot 'Bad Roman' did not disappoint. The modern twist on classic Italian dishes was delightful. The service was top-notch, and the atmosphere was buzzing with energy. Will return!"
)

Reservation.create!(
  user_id: 3,
  restaurant_id: bad_roman.id,
  party_size: 3,
  date: '2022-02-15',
  time: "2000-01-01T16:30:00.000-05:00",
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: bad_roman.id,
  overall_rating: 3,
  food_rating: 3,
  service_rating: 3,
  ambiance_rating: 5,
  value_rating: 3,
  body: "At Bad Roman, the ambiance was the star of the evening with its chic decor. The dishes were good but didn't quite reach the heights I was expecting for the price."
)

Reservation.create!(
  user_id: 4,
  restaurant_id: bad_roman.id,
  party_size: 4,
  date: '2022-03-22',
  time: "2000-01-01T16:30:00.000-05:00",
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: bad_roman.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 4,
  ambiance_rating: 5,
  value_rating: 4,
  body: "Bad Roman offers a beautifully designed space and a menu that complements it well. The pasta was fresh, and the sauces were flavorful. A solid choice for Italian cuisine lovers."
)

Reservation.create!(
  user_id: 5,
  restaurant_id: bad_roman.id,
  party_size: 5,
  date: '2022-04-18',
  time: "2000-01-01T16:30:00.000-05:00",
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: bad_roman.id,
  overall_rating: 2,
  food_rating: 2,
  service_rating: 2,
  ambiance_rating: 4,
  value_rating: 2,
  body: "The expectations were high for Bad Roman, but unfortunately, they were not met. The service was slower than we would have liked, and the dishes were somewhat underwhelming."
)

Reservation.create!(
  user_id: 6,
  restaurant_id: bad_roman.id,
  party_size: 6,
  date: '2022-06-30',
  time: "2000-01-01T16:30:00.000-05:00",
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: bad_roman.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 4,
  body: "Bad Roman is a triumph of Italian dining in NYC. Each course was better than the last, and the wine recommendations were spot on. The ambiance made for an unforgettable dining experience."
)

Reservation.create!(
  user_id: 7,
  restaurant_id: bad_roman.id,
  party_size: 7,
  date: '2022-08-24',
  time: "2000-01-01T16:30:00.000-05:00",
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: bad_roman.id,
  overall_rating: 3,
  food_rating: 4,
  service_rating: 3,
  ambiance_rating: 5,
  value_rating: 3,
  body: "While the setting at Bad Roman was impressive, the service had moments of inconsistency. The food was a solid offering of Italian cuisine, though the prices were on the higher side."
)

Reservation.create!(
  user_id: 8,
  restaurant_id: bad_roman.id,
  party_size: 2,
  date: '2022-10-12',
  time: "2000-01-01T16:30:00.000-05:00",
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: bad_roman.id,
  overall_rating: 4,
  food_rating: 5,
  service_rating: 3,
  ambiance_rating: 4,
  value_rating: 3,
  body: "The culinary experience at Bad Roman was quite enjoyable, with dishes showcasing true Italian flavors. The service could be more attentive, but overall it was a pleasurable visit."
)

# Seeds for Reviews at Bombay Grill House

Review.create!(
  reservation_id: Reservation.create!(
    user_id: 12,
    restaurant_id: bombay_grill_house.id,
    party_size: 2,
    date: '2023-03-15',
    time: "2000-01-01T19:00:00.000-05:00"
  ).id,
  restaurant_id: bombay_grill_house.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 4,
  value_rating: 5,
  body: "Bombay Grill House serves up some of the most authentic and flavorful Indian cuisine I've had outside of Mumbai. The butter chicken was rich and creamy, and the tandoori chicken was perfectly spiced and tender."
)

Review.create!(
  reservation_id: Reservation.create!(
    user_id: 11,
    restaurant_id: bombay_grill_house.id,
    party_size: 3,
    date: '2022-11-20',
    time: "2000-01-01T20:00:00.000-05:00"
  ).id,
  restaurant_id: bombay_grill_house.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 4,
  ambiance_rating: 4,
  value_rating: 4,
  body: "The cozy atmosphere at Bombay Grill House made for a perfect dinner setting. Each dish, especially the award-winning chicken tikka masala, was a burst of traditional flavors."
)

Review.create!(
  reservation_id: Reservation.create!(
    user_id: 10,
    restaurant_id: bombay_grill_house.id,
    party_size: 4,
    date: '2022-08-05',
    time: "2000-01-01T18:30:00.000-05:00"
  ).id,
  restaurant_id: bombay_grill_house.id,
  overall_rating: 3,
  food_rating: 3,
  service_rating: 3,
  ambiance_rating: 3,
  value_rating: 3,
  body: "A decent Indian dining experience with a good selection of vegan options. The goan dishes were true to their roots. Service was satisfactory, and the prices were reasonable."
)

Review.create!(
  reservation_id: Reservation.create!(
    user_id: 9,
    restaurant_id: bombay_grill_house.id,
    party_size: 2,
    date: '2022-05-12',
    time: "2000-01-01T18:00:00.000-05:00"
  ).id,
  restaurant_id: bombay_grill_house.id,
  overall_rating: 2,
  food_rating: 2,
  service_rating: 2,
  ambiance_rating: 4,
  value_rating: 2,
  body: "While the ambiance at Bombay Grill House was inviting, the food did not live up to my expectations. The butter chicken lacked the richness I was hoping for, and the service was slower than ideal."
)

# Seeds for Reviews at Tito Murphy's

Review.create!(
  reservation_id: Reservation.create!(
    user_id: 8,
    restaurant_id: tito_murphys.id,
    party_size: 2,
    date: '2022-10-05',
    time: "2000-01-01T17:30:00.000-05:00"
  ).id,
  restaurant_id: tito_murphys.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 5,
  body: "Tito Murphy's brought the vibrant flavors of Mexico to the heart of New York. The enchiladas were divine, and the margaritas were the best I've ever had. A must-visit for any Mexican cuisine enthusiast."
)

Review.create!(
  reservation_id: Reservation.create!(
    user_id: 7,
    restaurant_id: tito_murphys.id,
    party_size: 4,
    date: '2022-08-18',
    time: "2000-01-01T19:00:00.000-05:00"
  ).id,
  restaurant_id: tito_murphys.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 4,
  ambiance_rating: 4,
  value_rating: 4,
  body: "A lively spot with a fantastic atmosphere. The tacos are a standout, and the tequila selection is impressive. Perfect for a fun night out."
)

Review.create!(
  reservation_id: Reservation.create!(
    user_id: 6,
    restaurant_id: tito_murphys.id,
    party_size: 3,
    date: '2022-07-21',
    time: "2000-01-01T20:00:00.000-05:00"
  ).id,
  restaurant_id: tito_murphys.id,
  overall_rating: 3,
  food_rating: 3,
  service_rating: 3,
  ambiance_rating: 5,
  value_rating: 3,
  body: "The decor at Tito Murphy's is fantastic, creating a truly Mexican vibe. The food, while good, wasn't as outstanding as I hoped, but the lively environment made up for it."
)

Review.create!(
  reservation_id: Reservation.create!(
    user_id: 5,
    restaurant_id: tito_murphys.id,
    party_size: 5,
    date: '2022-05-30',
    time: "2000-01-01T18:30:00.000-05:00"
  ).id,
  restaurant_id: tito_murphys.id,
  overall_rating: 2,
  food_rating: 2,
  service_rating: 2,
  ambiance_rating: 3,
  value_rating: 2,
  body: "Unfortunately, Tito Murphy's didn't live up to the hype. The service was slow, and the dishes lacked the bold flavors I was craving."
)

Review.create!(
  reservation_id: Reservation.create!(
    user_id: 4,
    restaurant_id: tito_murphys.id,
    party_size: 6,
    date: '2023-02-15',
    time: "2000-01-01T21:00:00.000-05:00"
  ).id,
  restaurant_id: tito_murphys.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 4,
  body: "Tito Murphy's offers an escape to a festive Mexican fiesta. The carne asada was tender and flavorful, and the staff made us feel like family."
)

Review.create!(
  reservation_id: Reservation.create!(
    user_id: 3,
    restaurant_id: tito_murphys.id,
    party_size: 7,
    date: '2023-05-10',
    time: "2000-01-01T18:00:00.000-05:00"
  ).id,
  restaurant_id: tito_murphys.id,
  overall_rating: 1,
  food_rating: 1,
  service_rating: 1,
  ambiance_rating: 4,
  value_rating: 1,
  body: "Very disappointed with my experience at Tito Murphy's. The service was inattentive, and the food was unremarkable. Not what I expected from such a well-located spot."
)

# Seeds for Reviews at Raosu Hotpot & Sushi

Review.create!(
  reservation_id: Reservation.create!(
    user_id: 12,
    restaurant_id: raosu_hotpot_sushi.id,
    party_size: 2,
    date: '2022-01-15',
    time: "2000-01-01T18:30:00.000-05:00"
  ).id,
  restaurant_id: raosu_hotpot_sushi.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 4,
  body: "Raosu Hotpot & Sushi offers a culinary journey that we didn't want to end. The hotpot experience was interactive and fun, and the sushi was fresh and expertly crafted. Can't wait to return!"
)

Review.create!(
  reservation_id: Reservation.create!(
    user_id: 11,
    restaurant_id: raosu_hotpot_sushi.id,
    party_size: 4,
    date: '2022-03-22',
    time: "2000-01-01T19:00:00.000-05:00"
  ).id,
  restaurant_id: raosu_hotpot_sushi.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 3,
  ambiance_rating: 4,
  value_rating: 4,
  body: "The blend of hotpot and sushi is a game-changer at Raosu. The variety is impressive, and each dish was a hit. Service could be a bit more attentive, but overall a great experience."
)

Review.create!(
  reservation_id: Reservation.create!(
    user_id: 10,
    restaurant_id: raosu_hotpot_sushi.id,
    party_size: 3,
    date: '2022-06-09',
    time: "2000-01-01T20:30:00.000-05:00"
  ).id,
  restaurant_id: raosu_hotpot_sushi.id,
  overall_rating: 3,
  food_rating: 3,
  service_rating: 5,
  ambiance_rating: 3,
  value_rating: 3,
  body: "Raosu has a great concept but the execution falls short on the hotpot. The sushi was excellent, though, with fresh ingredients and a nice presentation."
)

Review.create!(
  reservation_id: Reservation.create!(
    user_id: 9,
    restaurant_id: raosu_hotpot_sushi.id,
    party_size: 5,
    date: '2022-08-15',
    time: "2000-01-01T17:00:00.000-05:00"
  ).id,
  restaurant_id: raosu_hotpot_sushi.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 5,
  body: "Every bite at Raosu Hotpot & Sushi was a delight. The hotpot had an array of rich broths and premium ingredients, while the sushi bar provided exquisite flavors. Truly top-notch."
)

Review.create!(
  reservation_id: Reservation.create!(
    user_id: 8,
    restaurant_id: raosu_hotpot_sushi.id,
    party_size: 2,
    date: '2022-10-30',
    time: "2000-01-01T18:00:00.000-05:00"
  ).id,
  restaurant_id: raosu_hotpot_sushi.id,
  overall_rating: 2,
  food_rating: 2,
  service_rating: 2,
  ambiance_rating: 4,
  value_rating: 2,
  body: "Wanted to love Raosu Hotpot & Sushi, but unfortunately, it didn't meet expectations. The hotpot was lukewarm, and the sushi lacked the wow factor for the price point."
)

Review.create!(
  reservation_id: Reservation.create!(
    user_id: 7,
    restaurant_id: raosu_hotpot_sushi.id,
    party_size: 4,
    date: '2023-01-20',
    time: "2000-01-01T21:00:00.000-05:00"
  ).id,
  restaurant_id: raosu_hotpot_sushi.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 4,
  ambiance_rating: 5,
  value_rating: 3,
  body: "The ambiance at Raosu is unbeatable, with a modern twist on traditional Asian dining. The hotpot was satisfying, but the sushi, although fresh, was not particularly memorable."
)

Review.create!(
  reservation_id: Reservation.create!(
    user_id: 6,
    restaurant_id: raosu_hotpot_sushi.id,
    party_size: 6,
    date: '2023-04-05',
    time: "2000-01-01T19:30:00.000-05:00"
  ).id,
  restaurant_id: raosu_hotpot_sushi.id,
  overall_rating: 1,
  food_rating: 1,
  service_rating: 1,
  ambiance_rating: 3,
  value_rating: 1,
  body: "Disappointing visit to Raosu Hotpot & Sushi. With such a prime location, I expected more. The service was incredibly slow, and the food was subpar for what you pay."
)

# Seeds for Reviews at The Ready Rooftop Bar

Review.create!(
  reservation_id: Reservation.create!(
    user_id: 8,
    restaurant_id: the_ready_rooftop_bar.id,
    party_size: 2,
    date: '2022-01-15',
    time: "2000-01-01T18:30:00.000-05:00"
  ).id,
  restaurant_id: the_ready_rooftop_bar.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 4,
  body: "The Ready Rooftop Bar was a delightful surprise. With its cozy ambiance and great city views, it's a perfect spot for evening drinks and small bites. Service was attentive and quick."
)

Review.create!(
  reservation_id: Reservation.create!(
    user_id: 7,
    restaurant_id: the_ready_rooftop_bar.id,
    party_size: 4,
    date: '2022-03-22',
    time: "2000-01-01T19:00:00.000-05:00"
  ).id,
  restaurant_id: the_ready_rooftop_bar.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 4,
  ambiance_rating: 5,
  value_rating: 4,
  body: "Fantastic rooftop vibe at The Ready. It's the ideal place for a casual yet chic outing with friends. The cocktails are inventive, and the food is tasty and well-presented."
)

Review.create!(
  reservation_id: Reservation.create!(
    user_id: 6,
    restaurant_id: the_ready_rooftop_bar.id,
    party_size: 3,
    date: '2022-06-09',
    time: "2000-01-01T20:30:00.000-05:00"
  ).id,
  restaurant_id: the_ready_rooftop_bar.id,
  overall_rating: 3,
  food_rating: 3,
  service_rating: 3,
  ambiance_rating: 4,
  value_rating: 3,
  body: "The Ready has a nice atmosphere for a rooftop bar, but the menu is somewhat limited. Drinks were good but not outstanding. It's a decent place for a casual hangout."
)

Review.create!(
  reservation_id: Reservation.create!(
    user_id: 5,
    restaurant_id: the_ready_rooftop_bar.id,
    party_size: 5,
    date: '2022-08-15',
    time: "2000-01-01T17:00:00.000-05:00"
  ).id,
  restaurant_id: the_ready_rooftop_bar.id,
  overall_rating: 2,
  food_rating: 2,
  service_rating: 2,
  ambiance_rating: 5,
  value_rating: 2,
  body: "Loved the rooftop setup at The Ready, but the service was disappointing. Our orders took ages, and the food, when it arrived, was just average. It could have been an off day, but it dampened the experience."
)

Review.create!(
  reservation_id: Reservation.create!(
    user_id: 4,
    restaurant_id: the_ready_rooftop_bar.id,
    party_size: 6,
    date: '2022-10-30',
    time: "2000-01-01T18:00:00.000-05:00"
  ).id,
  restaurant_id: the_ready_rooftop_bar.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 5,
  body: "The Ready Rooftop Bar is a gem in the East Village. It has a vibrant atmosphere with great music and even better drinks. The staff made us feel right at home. Definitely a must-visit for a fun night out!"
)

# Seeds for Reviews at 11 Tigers

Review.create!(
  reservation_id: Reservation.create!(
    user_id: 12,
    restaurant_id: eleven_tigers.id,
    party_size: 2,
    date: '2022-01-15',
    time: "2000-01-01T18:00:00.000-05:00"
  ).id,
  restaurant_id: eleven_tigers.id,
  overall_rating: 4,
  food_rating: 5,
  service_rating: 4,
  ambiance_rating: 3,
  value_rating: 4,
  body: "The fusion of Thai and Japanese cuisine at 11 Tigers is innovative and delightful. The Crying Tiger Gyoza is a must-try. Unique flavors and a cozy speakeasy vibe."
)

Review.create!(
  reservation_id: Reservation.create!(
    user_id: 2,
    restaurant_id: eleven_tigers.id,
    party_size: 4,
    date: '2022-11-30',
    time: "2000-01-01T19:30:00.000-05:00"
  ).id,
  restaurant_id: eleven_tigers.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 5,
  body: "11 Tigers is a hidden gem. The Black Panther Curry was sublime, and the Tom Yum Ramen was the best I've had outside of Thailand. Service was impeccable, and the atmosphere was intimate."
)

Review.create!(
  reservation_id: Reservation.create!(
    user_id: 11,
    restaurant_id: eleven_tigers.id,
    party_size: 3,
    date: '2022-05-20',
    time: "2000-01-01T18:00:00.000-05:00"
  ).id,
  restaurant_id: eleven_tigers.id,
  overall_rating: 3,
  food_rating: 3,
  service_rating: 4,
  ambiance_rating: 4,
  value_rating: 3,
  body: "An interesting culinary experience, but some dishes didn't quite hit the mark. The ambiance is lovely, though, and it's a nice spot for a unique date night."
)

Review.create!(
  reservation_id: Reservation.create!(
    user_id: 10,
    restaurant_id: eleven_tigers.id,
    party_size: 2,
    date: '2022-08-08',
    time: "2000-01-01T19:00:00.000-05:00"
  ).id,
  restaurant_id: eleven_tigers.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 4,
  body: "Absolutely stunning experience at 11 Tigers. The Thai Larb Tuna was a revelation, and the vibe of the place is just so cool and relaxed. Highly recommended!"
)

Review.create!(
  reservation_id: Reservation.create!(
    user_id: 9,
    restaurant_id: eleven_tigers.id,
    party_size: 4,
    date: '2022-12-15',
    time: "2000-01-01T20:30:00.000-05:00"
  ).id,
  restaurant_id: eleven_tigers.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 4,
  ambiance_rating: 5,
  value_rating: 4,
  body: "A delightful evening with friends at 11 Tigers. Their fusion concept is executed brilliantly. The service was attentive without being intrusive, and the atmosphere is just right."
)

Review.create!(
  reservation_id: Reservation.create!(
    user_id: 8,
    restaurant_id: eleven_tigers.id,
    party_size: 5,
    date: '2023-03-03',
    time: "2000-01-01T21:00:00.000-05:00"
  ).id,
  restaurant_id: eleven_tigers.id,
  overall_rating: 2,
  food_rating: 2,
  service_rating: 3,
  ambiance_rating: 2,
  value_rating: 2,
  body: "Wanted to love it, but the food just wasn't up to par. The concept is great, but the execution needs work. The place has potential, but I left feeling underwhelmed."
)

# Reservation and Review Seeds for Cathédrale

Reservation.create!(
  user_id: 7,
  restaurant_id: cathedrale.id,
  party_size: 2,
  date: '2022-01-15',
  time: "2000-01-01T18:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: cathedrale.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 4,
  body: "Cathédrale’s ambiance is absolutely stunning, providing an unforgettable dining experience. The service was impeccable. The food, especially the Black Truffle Fettuccine, was delightful."
)

Reservation.create!(
  user_id: 6,
  restaurant_id: cathedrale.id,
  party_size: 3,
  date: '2022-04-10',
  time: "2000-01-01T19:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: cathedrale.id,
  overall_rating: 3,
  food_rating: 3,
  service_rating: 3,
  ambiance_rating: 4,
  value_rating: 3,
  body: "A good experience overall, but nothing that particularly stood out. The atmosphere is the highlight of Cathédrale. The food was good but not exceptional for the price point."
)

Reservation.create!(
  user_id: 5,
  restaurant_id: cathedrale.id,
  party_size: 4,
  date: '2022-08-22',
  time: "2000-01-01T20:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: cathedrale.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 5,
  body: "Cathédrale is an exceptional dining experience. The Rotisserie Chicken was cooked to perfection, and the service was attentive and friendly. The restaurant’s interior is breathtaking."
)

Reservation.create!(
  user_id: 4,
  restaurant_id: cathedrale.id,
  party_size: 5,
  date: '2023-02-03',
  time: "2000-01-01T21:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: cathedrale.id,
  overall_rating: 2,
  food_rating: 2,
  service_rating: 1,
  ambiance_rating: 4,
  value_rating: 2,
  body: "The ambiance of Cathédrale is its saving grace. Unfortunately, our experience was marred by slow service and underwhelming dishes. The expectations were high, but the reality didn't match up."
)

Reservation.create!(
  user_id: 3,
  restaurant_id: cathedrale.id,
  party_size: 6,
  date: '2023-07-12',
  time: "2000-01-01T18:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: cathedrale.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 4,
  body: "An unforgettable evening at Cathédrale. Every dish was a culinary delight, especially the Filet Mignon ’Banquiere’. The service was top-notch, and the unique décor made the night even more special."
)

# Reservation and Review Seeds for Nai Tapas Restaurant

Reservation.create!(
  user_id: 12,
  restaurant_id: nai_tapas.id,
  party_size: 2,
  date: '2022-01-20',
  time: "2000-01-01T18:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: nai_tapas.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 5,
  ambiance_rating: 4,
  value_rating: 4,
  body: "The tapas at Nai were delightful. Each dish was a burst of flavor, especially loved the Gambas al Ajillo. The atmosphere was cozy and inviting. Will definitely return!"
)

Reservation.create!(
  user_id: 11,
  restaurant_id: nai_tapas.id,
  party_size: 3,
  date: '2022-03-15',
  time: "2000-01-01T19:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: nai_tapas.id,
  overall_rating: 3,
  food_rating: 3,
  service_rating: 3,
  ambiance_rating: 4,
  value_rating: 3,
  body: "A good experience with a variety of tapas. The service was decent, and the setting was nice. Expected a bit more flavor in some dishes, but overall a pleasant evening."
)

Reservation.create!(
  user_id: 10,
  restaurant_id: nai_tapas.id,
  party_size: 4,
  date: '2022-06-08',
  time: "2000-01-01T20:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: nai_tapas.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 5,
  body: "Nai Tapas is a gem in the East Village. The tapas are authentic and delicious, particularly the Patatas Bravas. The service was top-notch and the ambiance made our dining experience very special."
)

Reservation.create!(
  user_id: 9,
  restaurant_id: nai_tapas.id,
  party_size: 2,
  date: '2022-09-22',
  time: "2000-01-01T21:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: nai_tapas.id,
  overall_rating: 2,
  food_rating: 2,
  service_rating: 1,
  ambiance_rating: 3,
  value_rating: 2,
  body: "Expected more from Nai Tapas. The dishes were hit or miss, and the service was quite slow. It wasn't the vibrant tapas experience we were hoping for."
)

Reservation.create!(
  user_id: 8,
  restaurant_id: nai_tapas.id,
  party_size: 5,
  date: '2023-01-14',
  time: "2000-01-01T18:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: nai_tapas.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 4,
  body: "Nai Tapas never disappoints. The food is always fresh and flavorful. The Croquetas de Jamon were a highlight. Great ambiance for a group dinner."
)

Reservation.create!(
  user_id: 7,
  restaurant_id: nai_tapas.id,
  party_size: 3,
  date: '2023-04-11',
  time: "2000-01-01T19:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: nai_tapas.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 4,
  ambiance_rating: 4,
  value_rating: 3,
  body: "A solid choice for tapas in the city. The dishes are well-prepared and presented. The service was friendly. Prices are a bit high for the portion sizes."
)

Reservation.create!(
  user_id: 6,
  restaurant_id: nai_tapas.id,
  party_size: 2,
  date: '2023-08-30',
  time: "2000-01-01T20:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: nai_tapas.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 4,
  body: "Nai Tapas is an excellent choice for an intimate dinner. The variety of tapas allows for a great culinary adventure. Particularly enjoyed the seafood dishes."
)

Reservation.create!(
  user_id: 5,
  restaurant_id: nai_tapas.id,
  party_size: 4,
  date: '2023-10-05',
  time: "2000-01-01T21:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: nai_tapas.id,
  overall_rating: 3,
  food_rating: 3,
  service_rating: 3,
  ambiance_rating: 4,
  value_rating: 3,
  body: "An average experience at Nai Tapas. Some dishes were quite enjoyable while others lacked the expected flavor. The ambiance is nice, but the overall experience could be better."
)

Reservation.create!(
  user_id: 12,
  restaurant_id: pineapple_club.id,
  party_size: 4,
  date: '2023-05-15',
  time: "2000-01-01T11:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: pineapple_club.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 4,
  body: "Absolutely loved the tropical vibes at Pineapple Club! The Espresso Martini is indeed the best in NYC. The brunch menu was delightful, especially the Banana Bread French toast. Can't wait to go back!"
)

Reservation.create!(
  user_id: 11,
  restaurant_id: pineapple_club.id,
  party_size: 2,
  date: '2023-06-10',
  time: "2000-01-01T12:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: pineapple_club.id,
  overall_rating: 3,
  food_rating: 4,
  service_rating: 2,
  ambiance_rating: 4,
  value_rating: 3,
  body: "The Pineapple Club has a great atmosphere and the drinks are innovative. However, the service was a bit slow. The food was good but not outstanding for the price."
)

Reservation.create!(
  user_id: 10,
  restaurant_id: pineapple_club.id,
  party_size: 3,
  date: '2023-07-20',
  time: "2000-01-01T13:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: pineapple_club.id,
  overall_rating: 4,
  food_rating: 5,
  service_rating: 4,
  ambiance_rating: 4,
  value_rating: 4,
  body: "A refreshing escape in the city. The tropical theme is well-executed, and the cocktails are exceptional. The menu offers a good mix of flavors. Definitely worth visiting for a unique experience."
)

Reservation.create!(
  user_id: 9,
  restaurant_id: pineapple_club.id,
  party_size: 5,
  date: '2023-08-11',
  time: "2000-01-01T14:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: pineapple_club.id,
  overall_rating: 2,
  food_rating: 2,
  service_rating: 2,
  ambiance_rating: 5,
  value_rating: 2,
  body: "Loved the decor and ambiance, but that's where the excitement ended. The food was underwhelming and overpriced. The service was lacking enthusiasm. It's more style than substance."
)

Reservation.create!(
  user_id: 8,
  restaurant_id: pineapple_club.id,
  party_size: 6,
  date: '2023-09-05',
  time: "2000-01-01T15:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: pineapple_club.id,
  overall_rating: 5,
  food_rating: 4,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 4,
  body: "The Pineapple Club is a fantastic spot for a fun night out. The cocktails are creative and delicious, and the ambiance is lively. Great spot for a group hangout. The menu might be a bit pricey, but it's worth it for the experience."
)

Reservation.create!(
  user_id: 8,
  restaurant_id: wildair.id,
  party_size: 4,
  date: '2023-01-15',
  time: "2000-01-01T18:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: wildair.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 4,
  value_rating: 4,
  body: "Wildair is a gem in the East Village. The wine selection is impressive, and the small plates are exquisite. Perfect for a casual yet sophisticated night out."
)

Reservation.create!(
  user_id: 7,
  restaurant_id: wildair.id,
  party_size: 2,
  date: '2023-02-20',
  time: "2000-01-01T19:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: wildair.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 4,
  ambiance_rating: 5,
  value_rating: 3,
  body: "A cozy spot with an intimate atmosphere. The wine list is extensive and well-curated. Food is great but a bit pricey. Overall, a wonderful experience."
)

Reservation.create!(
  user_id: 6,
  restaurant_id: wildair.id,
  party_size: 3,
  date: '2023-03-18',
  time: "2000-01-01T20:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: wildair.id,
  overall_rating: 3,
  food_rating: 3,
  service_rating: 2,
  ambiance_rating: 4,
  value_rating: 3,
  body: "The ambiance at Wildair is nice, but the service was a bit slow. The food was good, but I expected more from a place with such high ratings."
)

Reservation.create!(
  user_id: 5,
  restaurant_id: wildair.id,
  party_size: 5,
  date: '2023-04-25',
  time: "2000-01-01T21:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: wildair.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 5,
  body: "Every dish was a delightful surprise, and the wine recommendations were spot-on. The staff is knowledgeable and friendly. Wildair is a must-visit for wine lovers."
)

Reservation.create!(
  user_id: 4,
  restaurant_id: wildair.id,
  party_size: 2,
  date: '2023-08-10',
  time: "2000-01-01T17:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: wildair.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 3,
  ambiance_rating: 5,
  value_rating: 4,
  body: "A nice spot for a date night. The wine selection is vast, and the small plates are tasty. The service could be a bit more attentive."
)

Reservation.create!(
  user_id: 3,
  restaurant_id: wildair.id,
  party_size: 6,
  date: '2023-10-05',
  time: "2000-01-01T18:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: wildair.id,
  overall_rating: 2,
  food_rating: 2,
  service_rating: 1,
  ambiance_rating: 4,
  value_rating: 2,
  body: "Disappointed with the service at Wildair. The staff seemed overwhelmed, and it took ages for our orders to arrive. The food was average, not what we expected from the rave reviews."
)

# Pylos

Reservation.create!(
  user_id: 12,
  restaurant_id: pylos.id,
  party_size: 4,
  date: '2022-01-15',
  time: "2000-01-01T12:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: pylos.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 4,
  body: "Pylos offers a taste of Greece in NYC! The authentic dishes are bursting with flavor, and the service is warm and welcoming. A must-visit for Greek cuisine lovers."
)

Reservation.create!(
  user_id: 11,
  restaurant_id: pylos.id,
  party_size: 2,
  date: '2022-03-22',
  time: "2000-01-01T11:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: pylos.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 4,
  ambiance_rating: 4,
  value_rating: 4,
  body: "A cozy spot for Greek cuisine. The dishes are well-prepared and flavorful. The service was attentive without being overbearing. Great for a date night!"
)

Reservation.create!(
  user_id: 10,
  restaurant_id: pylos.id,
  party_size: 3,
  date: '2022-06-18',
  time: "2000-01-01T11:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: pylos.id,
  overall_rating: 3,
  food_rating: 3,
  service_rating: 2,
  ambiance_rating: 4,
  value_rating: 3,
  body: "The ambiance at Pylos is lovely, but the service was a bit slow. The dishes were good, though some lacked the wow factor I was expecting."
)

Reservation.create!(
  user_id: 9,
  restaurant_id: pylos.id,
  party_size: 5,
  date: '2022-08-25',
  time: "2000-01-01T11:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: pylos.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 5,
  body: "Outstanding experience at Pylos. The Greek flavors are authentic and the presentation is beautiful. The staff made us feel at home. Highly recommend!"
)

Reservation.create!(
  user_id: 8,
  restaurant_id: pylos.id,
  party_size: 6,
  date: '2023-02-10',
  time: "2000-01-01T21:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: pylos.id,
  overall_rating: 2,
  food_rating: 2,
  service_rating: 1,
  ambiance_rating: 3,
  value_rating: 2,
  body: "Unfortunately, our experience at Pylos didn't meet expectations. Service was poor, and the food, while decent, didn't justify the wait or the price."
)

# Black ant

Reservation.create!(
  user_id: 7,
  restaurant_id: the_black_ant.id,
  party_size: 2,
  date: '2022-05-15',
  time: "2000-01-01T18:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: the_black_ant.id,
  overall_rating: 4,
  food_rating: 5,
  service_rating: 3,
  ambiance_rating: 4,
  value_rating: 4,
  body: "Unique take on Mexican cuisine with an intriguing menu. The food was delightful, especially the mole. Service was okay but could be more attentive."
)

Reservation.create!(
  user_id: 6,
  restaurant_id: the_black_ant.id,
  party_size: 4,
  date: '2022-07-22',
  time: "2000-01-01T19:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: the_black_ant.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 5,
  body: "Amazing experience! The Black Ant's modern twist on Mexican food was a delightful surprise. Every dish was a hit, and the cocktails were perfect."
)

Reservation.create!(
  user_id: 5,
  restaurant_id: the_black_ant.id,
  party_size: 3,
  date: '2022-10-10',
  time: "2000-01-01T20:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: the_black_ant.id,
  overall_rating: 3,
  food_rating: 3,
  service_rating: 2,
  ambiance_rating: 4,
  value_rating: 3,
  body: "An interesting concept but execution fell short. The flavors were hit or miss. Service was slow, and the ambiance, while nice, didn't compensate for the other shortcomings."
)

Reservation.create!(
  user_id: 4,
  restaurant_id: the_black_ant.id,
  party_size: 5,
  date: '2023-03-05',
  time: "2000-01-01T21:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: the_black_ant.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 5,
  ambiance_rating: 4,
  value_rating: 4,
  body: "The Black Ant offers an innovative approach to Mexican cuisine. The dishes are well-prepared and creative. The service was the highlight of the evening, very attentive and friendly."
)

# Rosa Mexicano

Reservation.create!(
  user_id: 12,
  restaurant_id: rosa_mexicano.id,
  party_size: 4,
  date: '2021-05-15',
  time: "2000-01-01T18:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: rosa_mexicano.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 5,
  ambiance_rating: 4,
  value_rating: 4,
  body: "Rosa Mexicano offers a vibrant atmosphere with a menu that surprises. The guacamole was a hit, and the margaritas were perfectly mixed. Service was outstanding."
)

Reservation.create!(
  user_id: 11,
  restaurant_id: rosa_mexicano.id,
  party_size: 2,
  date: '2021-08-22',
  time: "2000-01-01T19:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: rosa_mexicano.id,
  overall_rating: 3,
  food_rating: 3,
  service_rating: 3,
  ambiance_rating: 4,
  value_rating: 3,
  body: "A decent Mexican dining experience, but nothing exceptional. The dishes were good but lacked the wow factor. The ambiance is great for a casual night out."
)

Reservation.create!(
  user_id: 10,
  restaurant_id: rosa_mexicano.id,
  party_size: 3,
  date: '2021-10-10',
  time: "2000-01-01T20:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: rosa_mexicano.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 5,
  body: "Absolutely loved Rosa Mexicano! The food was authentic and delicious, and the service was impeccable. The atmosphere is lively and welcoming. Will definitely return."
)

Reservation.create!(
  user_id: 9,
  restaurant_id: rosa_mexicano.id,
  party_size: 5,
  date: '2022-03-05',
  time: "2000-01-01T21:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: rosa_mexicano.id,
  overall_rating: 2,
  food_rating: 2,
  service_rating: 1,
  ambiance_rating: 3,
  value_rating: 2,
  body: "Disappointed with the service and the food at Rosa Mexicano. The waitstaff seemed overwhelmed, and the food was underwhelming for the price. Not what we expected."
)

Reservation.create!(
  user_id: 8,
  restaurant_id: rosa_mexicano.id,
  party_size: 4,
  date: '2022-06-18',
  time: "2000-01-01T18:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: rosa_mexicano.id,
  overall_rating: 3,
  food_rating: 4,
  service_rating: 3,
  ambiance_rating: 4,
  value_rating: 3,
  body: "The food at Rosa Mexicano was good, especially the tequila selection. However, the service was slow and somewhat inattentive. Great ambiance for groups."
)

Reservation.create!(
  user_id: 7,
  restaurant_id: rosa_mexicano.id,
  party_size: 6,
  date: '2022-09-20',
  time: "2000-01-01T19:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: rosa_mexicano.id,
  overall_rating: 4,
  food_rating: 5,
  service_rating: 4,
  ambiance_rating: 5,
  value_rating: 4,
  body: "Rosa Mexicano was a delightful experience with its lively atmosphere and delicious Mexican fare. The staff were friendly and efficient, making for a pleasant evening."
)

# Xu's Public House

Reservation.create!(
  user_id: 7,
  restaurant_id: xus_public_house.id,
  party_size: 2,
  date: '2022-02-14',
  time: "2000-01-01T18:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: xus_public_house.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 4,
  body: "Xu's Public House was a delightful discovery. The dim sum is some of the best I've had outside of Hong Kong. The ambiance is modern yet cozy, perfect for our Valentine's Day dinner."
)

Reservation.create!(
  user_id: 8,
  restaurant_id: xus_public_house.id,
  party_size: 4,
  date: '2022-05-20',
  time: "2000-01-01T19:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: xus_public_house.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 4,
  ambiance_rating: 4,
  value_rating: 3,
  body: "A good experience at Xu's. The Cantonese dishes were authentic and flavorful. Service was attentive without being intrusive. Prices are a bit high, but it's worth it for the quality."
)

Reservation.create!(
  user_id: 9,
  restaurant_id: xus_public_house.id,
  party_size: 3,
  date: '2022-08-11',
  time: "2000-01-01T20:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: xus_public_house.id,
  overall_rating: 3,
  food_rating: 3,
  service_rating: 2,
  ambiance_rating: 4,
  value_rating: 3,
  body: "Xu's has great potential but fell short on service during our visit. The dim sum was decent, but not outstanding. Loved the decor and setting, though."
)

Reservation.create!(
  user_id: 10,
  restaurant_id: xus_public_house.id,
  party_size: 5,
  date: '2022-11-03',
  time: "2000-01-01T18:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: xus_public_house.id,
  overall_rating: 2,
  food_rating: 2,
  service_rating: 2,
  ambiance_rating: 3,
  value_rating: 2,
  body: "Expected more from Xu's Public House based on the hype. The dishes lacked the depth of flavor typical in Cantonese cuisine. Service was slow despite the restaurant not being full."
)

Reservation.create!(
  user_id: 11,
  restaurant_id: xus_public_house.id,
  party_size: 6,
  date: '2023-01-15',
  time: "2000-01-01T21:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: xus_public_house.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 5,
  ambiance_rating: 4,
  value_rating: 4,
  body: "Xu's Public House is a charming spot in Union Square. The dim sum menu is impressive and well-executed. Service was top-notch. A bit pricey but worth it for a special occasion."
)

Reservation.create!(
  user_id: 12,
  restaurant_id: max_brenner.id,
  party_size: 2,
  date: '2022-03-15',
  time: "2000-01-01T18:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: max_brenner.id,
  overall_rating: 5,
  food_rating: 4,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 4,
  body: "A chocolate lover's paradise. The desserts were heavenly, and the savory options were surprisingly good too. A fantastic spot for a casual date."
)

Reservation.create!(
  user_id: 11,
  restaurant_id: max_brenner.id,
  party_size: 4,
  date: '2022-06-21',
  time: "2000-01-01T19:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: max_brenner.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 3,
  ambiance_rating: 4,
  value_rating: 4,
  body: "Max Brenner is always a treat. The chocolate-infused menu is unique and delightful. Service was a bit slow this time, but it's usually better."
)

Reservation.create!(
  user_id: 10,
  restaurant_id: max_brenner.id,
  party_size: 3,
  date: '2022-10-05',
  time: "2000-01-01T20:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: max_brenner.id,
  overall_rating: 3,
  food_rating: 3,
  service_rating: 3,
  ambiance_rating: 4,
  value_rating: 3,
  body: "Max Brenner is an interesting experience with a focus on chocolate. The main dishes were average, but the desserts are worth coming back for."
)

Reservation.create!(
  user_id: 9,
  restaurant_id: max_brenner.id,
  party_size: 5,
  date: '2023-02-12',
  time: "2000-01-01T21:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: max_brenner.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 5,
  body: "Incredible experience at Max Brenner. The chocolate-focused menu is a dream come true. Everything from the drinks to the desserts was perfect."
)

Reservation.create!(
  user_id: 8,
  restaurant_id: oceans.id,
  party_size: 2,
  date: '2022-01-20',
  time: "2000-01-01T18:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: oceans.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 4,
  ambiance_rating: 5,
  value_rating: 4,
  body: "Stunning seafood selection with remarkable flavors. The ambiance was perfect for a sophisticated evening. Service was attentive but not intrusive."
)

Reservation.create!(
  user_id: 7,
  restaurant_id: oceans.id,
  party_size: 4,
  date: '2022-05-10',
  time: "2000-01-01T19:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: oceans.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 4,
  ambiance_rating: 4,
  value_rating: 3,
  body: "Oceans offered a delightful seafood experience. Fresh and flavorful dishes. A bit pricey, but expected for the quality and location."
)

Reservation.create!(
  user_id: 6,
  restaurant_id: oceans.id,
  party_size: 3,
  date: '2022-08-15',
  time: "2000-01-01T20:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: oceans.id,
  overall_rating: 3,
  food_rating: 3,
  service_rating: 2,
  ambiance_rating: 4,
  value_rating: 3,
  body: "The seafood was fresh, but the dishes lacked the wow factor I was expecting. Service was slower than anticipated. Nice ambiance though."
)

Reservation.create!(
  user_id: 5,
  restaurant_id: oceans.id,
  party_size: 6,
  date: '2023-03-22',
  time: "2000-01-01T21:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: oceans.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 4,
  body: "An exceptional seafood experience. Every dish was a culinary adventure. Excellent service and a vibrant, stylish setting."
)

Reservation.create!(
  user_id: 4,
  restaurant_id: oceans.id,
  party_size: 5,
  date: '2023-10-05',
  time: "2000-01-01T18:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: oceans.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 3,
  ambiance_rating: 5,
  value_rating: 3,
  body: "Oceans lives up to its reputation with excellent seafood. The ambiance is top-notch. Service could be a bit more attentive."
)

Reservation.create!(
  user_id: 11,
  restaurant_id: craft.id,
  party_size: 2,
  date: '2022-02-14',
  time: "2000-01-01T19:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: craft.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 4,
  value_rating: 4,
  body: "Valentine's Day dinner at Craft was memorable. The scallops were perfectly cooked, and the short ribs melted in the mouth. Exceptional service!"
)

Reservation.create!(
  user_id: 10,
  restaurant_id: craft.id,
  party_size: 4,
  date: '2022-06-25',
  time: "2000-01-01T18:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: craft.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 4,
  ambiance_rating: 5,
  value_rating: 3,
  body: "Craft offers an exquisite dining experience. The seasonal menu was fresh and flavorful. A bit on the pricey side, but the ambiance and food quality make it worth it."
)

Reservation.create!(
  user_id: 9,
  restaurant_id: craft.id,
  party_size: 3,
  date: '2022-09-10',
  time: "2000-01-01T20:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: craft.id,
  overall_rating: 3,
  food_rating: 3,
  service_rating: 2,
  ambiance_rating: 4,
  value_rating: 3,
  body: "The food at Craft was good, but not outstanding. Expected more attentive service at this price point. The ambiance was nice though."
)

Reservation.create!(
  user_id: 8,
  restaurant_id: craft.id,
  party_size: 5,
  date: '2023-01-08',
  time: "2000-01-01T21:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: craft.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 4,
  body: "A fantastic experience at Craft! Every dish was a delight, especially the scallops. Impeccable service and a cozy atmosphere."
)

Reservation.create!(
  user_id: 7,
  restaurant_id: craft.id,
  party_size: 6,
  date: '2023-04-22',
  time: "2000-01-01T18:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: craft.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 3,
  ambiance_rating: 4,
  value_rating: 3,
  body: "Craft's menu offered a nice variety of dishes. The quality of the ingredients was evident. Service was fine, though a bit slow."
)

Reservation.create!(
  user_id: 6,
  restaurant_id: craft.id,
  party_size: 7,
  date: '2023-08-05',
  time: "2000-01-01T19:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: craft.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 4,
  value_rating: 4,
  body: "Dining at Craft was an exceptional experience. The beef short ribs were a standout. Great service in a relaxed yet upscale setting."
)

Reservation.create!(
  user_id: 5,
  restaurant_id: bhatti_indian_grill.id,
  party_size: 4,
  date: '2022-01-15',
  time: "2000-01-01T19:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: bhatti_indian_grill.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 4,
  value_rating: 4,
  body: "Bhatti Indian Grill offers an exceptional Indian dining experience. The flavors were authentic and robust, especially the butter chicken. The service was top-notch."
)

Reservation.create!(
  user_id: 4,
  restaurant_id: bhatti_indian_grill.id,
  party_size: 2,
  date: '2022-05-22',
  time: "2000-01-01T18:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: bhatti_indian_grill.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 4,
  ambiance_rating: 4,
  value_rating: 3,
  body: "A delightful experience at Bhatti Indian Grill. The tandoori dishes were perfectly cooked, and the spices were well-balanced. Great for a romantic evening!"
)

Reservation.create!(
  user_id: 3,
  restaurant_id: bhatti_indian_grill.id,
  party_size: 6,
  date: '2022-08-10',
  time: "2000-01-01T20:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: bhatti_indian_grill.id,
  overall_rating: 3,
  food_rating: 3,
  service_rating: 2,
  ambiance_rating: 4,
  value_rating: 3,
  body: "The food at Bhatti Indian Grill was good, but not exceptional. The service was a bit slow, considering the restaurant wasn't that busy."
)

Reservation.create!(
  user_id: 2,
  restaurant_id: bhatti_indian_grill.id,
  party_size: 3,
  date: '2023-03-18',
  time: "2000-01-01T21:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: bhatti_indian_grill.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 5,
  body: "Every bite at Bhatti Indian Grill was a discovery of new flavors. The chef's special lamb dish was a standout. Attentive service and a cozy ambiance."
)

Reservation.create!(
  user_id: 1,
  restaurant_id: bhatti_indian_grill.id,
  party_size: 5,
  date: '2023-07-30',
  time: "2000-01-01T18:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: bhatti_indian_grill.id,
  overall_rating: 4,
  food_rating: 5,
  service_rating: 3,
  ambiance_rating: 4,
  value_rating: 4,
  body: "Bhatti Indian Grill offers a truly authentic North Indian experience. The biryani and kebabs were excellent. Service could be more prompt."
)

# The Stand

Reservation.create!(
  user_id: 11,
  restaurant_id: the_stand.id,
  party_size: 2,
  date: '2022-02-15',
  time: "2000-01-01T18:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: the_stand.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 4,
  ambiance_rating: 5,
  value_rating: 4,
  body: "Had an amazing evening at The Stand. The NY Style Pizzas were to die for, and the whiskey selection was impressive. The comedy show was an unexpected but delightful bonus."
)

Reservation.create!(
  user_id: 10,
  restaurant_id: the_stand.id,
  party_size: 4,
  date: '2022-06-21',
  time: "2000-01-01T19:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: the_stand.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 5,
  body: "The Stand is a gem in Union Square! The homemade pastas were exceptional, and the crafted cocktails were unique. A perfect spot for dinner and entertainment."
)

Reservation.create!(
  user_id: 9,
  restaurant_id: the_stand.id,
  party_size: 3,
  date: '2023-01-10',
  time: "2000-01-01T20:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: the_stand.id,
  overall_rating: 3,
  food_rating: 3,
  service_rating: 2,
  ambiance_rating: 4,
  value_rating: 3,
  body: "Visited The Stand for the comedy but found the service a bit slow. The pizzas were good, but not the best I've had. Great ambiance for a night out though."
)

Reservation.create!(
  user_id: 8,
  restaurant_id: the_stand.id,
  party_size: 5,
  date: '2023-04-05',
  time: "2000-01-01T21:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: the_stand.id,
  overall_rating: 5,
  food_rating: 4,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 4,
  body: "The Stand offers a great mix of dining and entertainment. Loved the small plates and the extensive whiskey collection. The comedy acts were hilarious!"
)

# Tarallucci e Vino

Reservation.create!(
  user_id: 7,
  restaurant_id: tarallucci_e_vino.id,
  party_size: 2,
  date: '2021-03-12',
  time: "2000-01-01T18:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: tarallucci_e_vino.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 4,
  body: "A charming Italian escape in the heart of Union Square. The ambiance is rustic and cozy, perfect for a romantic evening. Their pasta dishes are a must-try."
)

Reservation.create!(
  user_id: 6,
  restaurant_id: tarallucci_e_vino.id,
  party_size: 3,
  date: '2021-07-25',
  time: "2000-01-01T19:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: tarallucci_e_vino.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 5,
  body: "The cooking class experience at Tarallucci e Vino was exceptional! Not only did we learn to make delicious Italian cuisine, but we also enjoyed the beautiful setting and friendly staff."
)

Reservation.create!(
  user_id: 5,
  restaurant_id: tarallucci_e_vino.id,
  party_size: 4,
  date: '2022-01-15',
  time: "2000-01-01T20:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: tarallucci_e_vino.id,
  overall_rating: 3,
  food_rating: 3,
  service_rating: 2,
  ambiance_rating: 4,
  value_rating: 3,
  body: "The ambiance at Tarallucci e Vino is inviting, but the service was slower than expected. The tarallucci cookies were delightful, but the main courses could use more flavor."
)

Reservation.create!(
  user_id: 4,
  restaurant_id: tarallucci_e_vino.id,
  party_size: 5,
  date: '2022-05-10',
  time: "2000-01-01T21:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: tarallucci_e_vino.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 4,
  body: "Loved the casual elegance of Tarallucci e Vino. The wine selection is superb, and their signature tarallucci is a must-try. A perfect place for an evening out with friends."
)

Reservation.create!(
  user_id: 3,
  restaurant_id: tarallucci_e_vino.id,
  party_size: 6,
  date: '2022-10-21',
  time: "2000-01-01T18:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: tarallucci_e_vino.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 3,
  ambiance_rating: 4,
  value_rating: 4,
  body: "Tarallucci e Vino offers a great Italian dining experience. The bakery's fresh bread was phenomenal. The service was good, but could be a bit more attentive."
)

Reservation.create!(
  user_id: 2,
  restaurant_id: tarallucci_e_vino.id,
  party_size: 2,
  date: '2023-04-05',
  time: "2000-01-01T19:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: tarallucci_e_vino.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 5,
  body: "An outstanding experience at Tarallucci e Vino. The ambiance transports you straight to Italy. Exceptional service, and the food was authentically delightful."
)

# Napkin Burger

Reservation.create!(
  user_id: 10,
  restaurant_id: napkin_burger.id,
  party_size: 4,
  date: '2022-02-14',
  time: "2000-01-01T18:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: napkin_burger.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 4,
  ambiance_rating: 4,
  value_rating: 5,
  body: "Absolutely loved the burgers at 5 Napkin Burger. Juicy and flavorful! The atmosphere was casual and perfect for a relaxed evening out."
)

Reservation.create!(
  user_id: 9,
  restaurant_id: napkin_burger.id,
  party_size: 2,
  date: '2022-06-22',
  time: "2000-01-01T19:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: napkin_burger.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 3,
  ambiance_rating: 4,
  value_rating: 4,
  body: "Good burgers with a decent selection of craft beers. Service was a bit slow, but the food made up for it."
)

Reservation.create!(
  user_id: 8,
  restaurant_id: napkin_burger.id,
  party_size: 3,
  date: '2022-11-08',
  time: "2000-01-01T20:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: napkin_burger.id,
  overall_rating: 3,
  food_rating: 3,
  service_rating: 2,
  ambiance_rating: 3,
  value_rating: 3,
  body: "The burgers were average, nothing exceptional. The service could be improved. It's a decent place if you're in the area and craving a burger."
)

Reservation.create!(
  user_id: 12,
  restaurant_id: napkin_burger.id,
  party_size: 5,
  date: '2023-01-15',
  time: "2000-01-01T18:00:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: napkin_burger.id,
  overall_rating: 5,
  food_rating: 5,
  service_rating: 5,
  ambiance_rating: 5,
  value_rating: 4,
  body: "Fantastic burgers and a great atmosphere. The staff was friendly and attentive. Definitely a must-visit for burger enthusiasts."
)

Reservation.create!(
  user_id: 11,
  restaurant_id: napkin_burger.id,
  party_size: 2,
  date: '2023-05-20',
  time: "2000-01-01T19:30:00.000-05:00"
)

Review.create!(
  reservation_id: Reservation.last.id,
  restaurant_id: napkin_burger.id,
  overall_rating: 4,
  food_rating: 4,
  service_rating: 4,
  ambiance_rating: 3,
  value_rating: 4,
  body: "Enjoyed a great meal at 5 Napkin Burger. The burgers are well-cooked and the portions are generous. A solid choice for a casual dinner."
)


# if reservation.save
#   puts "Created reservation ##{reservation.id} for user ##{user_id} at La Pizza & La Pasta."
# else
#   puts "Failed to create reservation for user ##{user_id}: #{reservation.errors.full_messages.join(", ")}"
# end

puts "Done!"