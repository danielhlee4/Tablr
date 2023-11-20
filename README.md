# Tablr README
## Overview
Tablr is a pixel perfect clone of OpenTable. The core functionality of Tablr allows users to browse restaurants and find/create party reservations. A user is able to leave a restaurant review on their completed reservations for others to view.

## [Tablr Live Link](https://tablr-web-service.onrender.com/)

## Technologies Used

**Ruby on Rails (Backend):** Rails handles server-side logic, responding to RESTful API requests and interacting with the PostgreSQL database to serve data to the frontend.

**React (Frontend):** React manages the user interface, providing a dynamic and responsive experience by updating the DOM in real-time as users interact with the application.

**NPM:** NPM manages dependencies for the project, allowing for the installation and maintenance of libraries and tools necessary for development.

**Webpack:** Webpack bundles and compiles the application's assets, transforming and optimizing them for efficient delivery to the client's browser.

**PostgreSQL:** PostgreSQL is the robust database system used to store all application data, offering reliable transactions and a powerful query system to the Rails backend.


**[Slick Carousel](https://kenwheeler.github.io/slick/):** Slick Carousel is a JavaScript libary for creating responsive carousels that can display one or more items at a time.

![slickcarousel](https://github.com/danielhlee4/Tablr/blob/main/frontend/src/assets/readme-carousel.gif)

## Core Features
### Restaurants
Simplistic design of restaurant information is a key feature of Tablr. The following describes how restaurant expense information was implemented on the home page:

![restaurant-expense](https://github.com/danielhlee4/Tablr/blob/main/frontend/src/assets/readme-expense.png)

Each restaurant index item displays '$$$$' with the corresponding amount of dollar signs filled in or greyed out.

![restaurant-expense-code](https://github.com/danielhlee4/Tablr/blob/main/frontend/src/assets/readme-expense-code.png)

The above code snippet shows how each dollar sign is rendered dynamically depending on the expense value saved in the restaurant's database. An `active` class name darkens the character, and `inactive` greys the character out.

### Reservations
Tablr reservations can be made between 11am and 10pm EST. To ensure the integrity of the reservation data, the following snippet demonstrates a time validation. It is designed to only allow a user to make a reservation in the time window on the hour or half hour (e.g 7pm, 7:30pm, 8pm)

![time-validation](https://github.com/danielhlee4/Tablr/blob/main/frontend/src/assets/readme-time-validation.png)