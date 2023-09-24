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
        infinite: true,
        speed: 450,
        slidesToShow: 5,
        slidesToScroll: 4,
    };

    return (
        <>
          <h1>Time to eat</h1>
          <Slider {...carouselSettings} className="carousel">
            {restaurants.map((restaurant) => (
              <RestaurantIndexItem key={restaurant.id} restaurant={restaurant} />
            ))}
          </Slider>
        </>
    );
};

export default RestaurantIndex;