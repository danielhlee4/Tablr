import { useEffect } from 'react';
import { Link, useParams } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import { getRestaurant, fetchRestaurant } from '../../store/restaurants';
import theready from '../../assets/theready.webp'

function RestaurantShow() {
    const {restaurantId} = useParams();
    const restaurant = useSelector(getRestaurant(restaurantId));
    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(fetchRestaurant(restaurantId));
    }, [restaurantId, dispatch])

    if (!restaurant) {
        return <div>Loading...</div>;
    }

    return (
        <>
            <img
                className='show-restaurant-image'
                src={theready}
                alt={restaurant.name}
            />
        </>
    );
}

export default RestaurantShow;