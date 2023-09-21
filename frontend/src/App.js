import React from 'react';
import { Route, Switch } from 'react-router-dom';
import Navigation from "./components/Navigation";
import Footer from "./components/Footer";
import RestaurantIndex from './components/Restaurants';

function App() {
  return (
    <>
      <Navigation />
      <Switch>
        <Route exact path="/" component={RestaurantIndex} />
      </Switch>
      <Footer />
    </>
  );
}

export default App;