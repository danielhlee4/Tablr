import React from 'react';
import { Route, Switch } from 'react-router-dom';
import Navigation from "./components/Navigation";
import Footer from "./components/Footer";
import RestaurantIndex from './components/Restaurants';
import RestaurantShow from './components/Restaurants/RestaurantShow';

function App() {
  return (
    <>
        <Navigation />
        <div className='container'>
          <Switch>
            <Route exact path="/" component={RestaurantIndex} />
            <Route exact path="/restaurants/:restaurantId" component={RestaurantShow} />
          </Switch>
        </div>  
        <Footer />
    </>
  );
}

export default App;