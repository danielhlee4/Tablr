import React from 'react';
import { Route, Switch } from 'react-router-dom';
import Navigation from "./components/Navigation";
import Footer from "./components/Footer";
import RestaurantIndex from './components/Restaurants';
import RestaurantShow from './components/Restaurants/RestaurantShow';
import ReservationIndex from './components/Reservations/index';
import ReservationTest from './components/Reservations/ReservationsTest';

function App() {
  return (
    <>
        <Navigation />
        <div className='container'>  
          <Switch>
            <Route exact path="/" component={RestaurantIndex} />
            <Route exact path="/restaurants/:restaurantId" component={RestaurantShow} />
            <Route exact path="/users/:userId" component={ReservationIndex} />
          </Switch>
        </div>  
        <Footer />
    </>
  );
}

export default App;