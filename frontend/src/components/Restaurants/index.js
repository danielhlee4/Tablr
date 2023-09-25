import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import RestaurantIndexItem from './RestaurantIndexItem';
import { getRestaurants, fetchRestaurants } from '../../store/restaurants';
import Slider from "react-slick";
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";
import './Restaurants.css';

function RestaurantIndex() {
    const restaurants = useSelector(getRestaurants);
    const dispatch = useDispatch();
    
    useEffect(() => {
        dispatch(fetchRestaurants());
    }, [dispatch]);

    const carouselSettings = {
        dots: true,
        infinite: false,
        speed: 450,
        slidesToShow: 5,
        slidesToScroll: 4,
    };

    const neighborhoods = ["Hell's Kitchen", "East Village", "Union Square"];

    return (
      <>
          {neighborhoods.map((neighborhood) => (
            <div className='index-content'>
              <div key={neighborhood} className='carousel-wrapper'>
                  <h1>{neighborhood}</h1>
                  <Slider {...carouselSettings} className="carousel">
                      {restaurants
                          .filter((restaurant) => restaurant.neighborhood === neighborhood)
                          .map((restaurant) => (
                              <RestaurantIndexItem key={restaurant.id} restaurant={restaurant} />
                          ))}
                  </Slider>
              </div>
            </div>
          ))}
      </>
  );
};

export default RestaurantIndex;