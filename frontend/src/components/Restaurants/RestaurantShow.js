import { useEffect } from 'react';
import { Link, useParams } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import { getRestaurant, fetchRestaurant } from '../../store/restaurants';

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
            {/* {restaurant && <h1>{restaurant.name}</h1>} */}
            <h1>{restaurant.name}</h1>
            <Link to="/">Restaurant Index</Link>
        </>
    );
}

export default RestaurantShow;